-- clone paq if not installed
local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
local should_install = false
if vim.fn.empty(vim.fn.glob(path)) > 0 then
  print('Installing paq-nvim')
  vim.fn.system {
    'git',
    'clone',
    '--depth=1',
    'https://github.com/savq/paq-nvim.git',
    path
  }
  should_install=true
  vim.cmd('packadd paq-nvim')
end

local paq=require "paq" 

paq({
  "savq/paq-nvim";
  "nvim-lua/plenary.nvim";
  "sainnhe/everforest";
  "voldikss/vim-floaterm";
  "neovim/nvim-lspconfig";
  {"ms-jpq/coq_nvim", branch="coq"};
  "nvim-treesitter/nvim-treesitter";
})

if should_install then
  print('Installing plugins')
  paq.install()
else
  vim.cmd('colorscheme everforest');
  require('disable_defaults')
  require('lsp')
  require('treesitter')
  require('floaterm')
end
