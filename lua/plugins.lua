local paq=require "paq" 

paq({
  "savq/paq-nvim";
  "nvim-lua/plenary.nvim";
  "voldikss/vim-floaterm";
  "neovim/nvim-lspconfig";
  {"ms-jpq/coq_nvim", branch="coq"};
  "nvim-treesitter/nvim-treesitter";
  "sainnhe/everforest";
  "Olical/conjure";
  'Olical/aniseed';
  'tomlion/vim-solidity';
  'jparise/vim-graphql';
  'sam4llis/nvim-tundra';
  'tpope/vim-repeat';
  'catppuccin/nvim';
})

function setupPlugins()
  -- needs to be called before we try to require coq
  vim.g.coq_settings={auto_start='shut-up'}
  -- vim.g.everforest_material_enable_italic=1
  -- vim.g.everforest_background='soft'
  -- require('colors');
  vim.g.background=os.getenv('term_background') or 'dark'
  require("catppuccin").setup({
    -- latte, frappe, macchiato, mocha
    flavour = "frappe",
    background = {
        light = "latte",
        dark = "macchiato",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
    }
  });
  vim.cmd('colorscheme catppuccin');
  require('disable_defaults')
  require('lsp')
  require('treesitter')
  require('floaterm')
  require('leap').set_default_keymaps()
end

if bootstrapped then
  print('Installing plugins')
  paq.install()
  vim.cmd('autocmd User PaqDoneInstall lua setupPlugins()')
  print('Bootstrapped and installed plugins')
else
  setupPlugins()
end
