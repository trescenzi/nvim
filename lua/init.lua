local nvim_lsp = require('lspconfig')
local lsp_completion = require("completion")
local lspconfig = require('lspconfig')

-- require'nvim-treesitter.configs'.setup {
  -- highlight = {
    -- enable = true,
  -- },
  -- indent = {
    -- enable = true
  -- }
-- }

local on_attach = function(client, bufnr)
  print('Attaching lsp')
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- gD -> go to decleration
  -- gd -> go to definition 
  -- K -> get info under cursor
  -- gi -> go to implementation
  -- ctrl + k -> get signature help
  -- space  + wl -> list folders in workspace
  -- gr -> list references to symbol
  -- space + e -> see diagnostic 
  -- [d or ]d -> go to next diagnostic
  -- space + q -> see all issues
  -- ca -> code action
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  if client.resolved_capabilities.completion then
    lsp_completion.on_attach(client, bufnr)
  end

end 

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md for
-- install instructions per language server
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = false,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)
local servers = {  "pyright", "cssls", "svelte", "jsonls", "rust_analyzer", "gopls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
nvim_lsp['denols'].setup {
   on_attach = on_attach,
  -- package.json sometimes aren't actually at the root especially for monorepos
  root_dir = lspconfig.util.root_pattern("tsconfig.json", ".git")
}
vim.lsp.set_log_level("debug")
