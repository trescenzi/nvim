require("formatter").setup {
    -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    javascript = {
      require("formatter.filetypes.javascript").prettierd
    },
    typescriptreact = {
      require("formatter.filetypes.javascript").prettierd
    },
    typescript = {
      require("formatter.filetypes.javascript").prettierd
    },
  }
}
