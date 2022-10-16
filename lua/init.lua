-- setup map functions for others to use
function nmap(s, c)
  vim.api.nvim_set_keymap("n", s, c, {});
end
function nnmap(s, c)
  vim.api.nvim_set_keymap("n", s, c, {noremap = true});
end
function vnmap(s, c)
  vim.api.nvim_set_keymap("v", s, c, {noremap = true});
end

-- stop coloring past 100 characters
-- vim.opt.synmaxcol=100
-- max line length is 80
-- vim.opt.textwidth=80

-- setup deep undo
vim.opt.undodir=vim.fn.stdpath('data') .. '/undodir'
vim.opt.undofile=true
vim.opt.undolevels=1000
vim.opt.undoreload=10000

--[[
-- Using netrw as the explore option as it does enough
-- - in normal mode explores in the current dir
--
-- in netrw:
-- % creates a new file
-- R renames a file
-- d creates a directory
--]]
vim.g.netrw_preview=1
vim.g.netrw_liststyle=3
vim.g.netrw_busettings="noma nomod nu nowrap ro nobl"
nnmap("-", ":Explore<CR>")

vim.opt.termguicolors=true
vim.opt.syntax="on"
vim.opt.number=true
vim.opt.smartindent=true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true

-- center file with space
nmap("<space>", "zz")

-- don't cut with d,
nnmap("d", '"_d')
vnmap("d", '"_d')
vnmap("p", '"_P')

-- disable mouse
vim.opt.mouse=""

require('find')
require('plugins')
