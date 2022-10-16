bootstrapped = false
local function bootstrap(giturl)
  local name = giturl:gsub(".*/", "")
  local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/' .. name
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    print('Installing ' .. name .. ' from ' .. giturl)
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      giturl,
      path
    }
    vim.cmd('packadd ' .. name)
    -- if we've bootstrapped we want to also install packages later
    bootstrapped = true
  end
end
-- clone paq if not installed
bootstrap('https://github.com/savq/paq-nvim')
