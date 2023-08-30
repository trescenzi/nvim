local paq=require "paq" 

paq({
  "savq/paq-nvim";
  "nvim-lua/plenary.nvim";
  "voldikss/vim-floaterm";
  "neovim/nvim-lspconfig";
  {"ms-jpq/coq_nvim", branch="coq"};
  "nvim-treesitter/nvim-treesitter";
  "jparise/vim-graphql";
  "f-person/git-blame.nvim";
  "ellisonleao/gruvbox.nvim";
  "Robitx/gp.nvim";
})

function setupPlugins()
  -- needs to be called before we try to require coq
  vim.g.coq_settings={auto_start='shut-up'}
  require('colors');
  vim.g.background=os.getenv('term_background') or 'dark'
  vim.cmd('colorscheme gruvbox');
  vim.g.gitblame_enabled=0;
  nnmap("<Leader>b", ":GitBlameToggle<CR>");
  require('disable_defaults')
  require('lsp')
  require('treesitter')
  require('floaterm')
  require('cgpt')
end

if bootstrapped then
  print('Installing plugins')
  paq.install()
  vim.cmd('autocmd User PaqDoneInstall lua setupPlugins()')
  print('Bootstrapped and installed plugins')
else
  setupPlugins()
end
