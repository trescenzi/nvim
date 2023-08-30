command_system_prompt = "You are an AI that strictly generates only code in the language of the file specified using common libraries for that language."
chat_system_prompt = "You are an AI assistant that is helping answer questions about software development. You're knowledgable and explain your answers in detail."
require("gp").setup({
  chat_system_prompt = chat_system_prompt,
  command_system_prompt = command_system_prompt,
  hooks = {
		InspectPlugin = function(plugin, params)
			print(string.format("Plugin structure:\n%s", vim.inspect(plugin)))
			print(string.format("Command params:\n%s", vim.inspect(params)))
		end,

		-- GpImplement finishes the provided selection/range based on comments in the code
		Implement = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please finish the code above following any comment instructions."
				.. "\n\nRespond just with the snippet of code that should be inserted."


			gp.Prompt(
				params,
				gp.Target.append,
				nil,
				gp.config.command_model,
				template,
				gp.config.command_system_prompt
			)
		end,

    JestTests = function(gp, params)
      local template = "I have the following code from {{filename}}:\n\n"
          .. "```{{filetype}}\n{{selection}}\n```\n\n"
          .. "Please write unit tests which cover the above code using jest."
      gp.Prompt(params, gp.Target.enew, nil, gp.config.command_model,
          template, gp.config.command_system_prompt)
    end,

    Regex = function(gp, params)
      local template = "Write a regex which will match the following: "
          .. "{{selection}}"
          .. "Include an explination for the regex. Do not include any other code beyond the regex string."
      gp.Prompt(params, gp.Target.append, nil, gp.config.command_model,
          template, "You are an AI assistant that writes regexes and explains them but doesn't know any programming languages")
    end,

    FourChat = function(gp, params)
      gp.Prompt(params, gp.Target.append, nil, gp.config.command_model,
          "{{selection}}", gp.config.chat_system_prompt)
    end,
	},
})

vim.keymap.set("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>")
vim.keymap.set("v", "<C-g>u", ":<C-u>'<,'>GpJestTests<cr>")
vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpRegex<cr>")
vim.keymap.set("v", "<C-g>4", ":<C-u>'<,'>GpFourChat<cr>")
