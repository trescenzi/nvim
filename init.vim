call plug#begin('~/.config/nvim/plugged')
" Pretty Colors
Plug 'sainnhe/forest-night'

Plug 'lifepillar/vim-colortemplate'

Plug 'nvim-lua/plenary.nvim'

" Fuzzy Completion via FZF
Plug 'voldikss/vim-floaterm'

" Completion + Language Server
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'chaoren/vim-wordmotion'

" Note Taking
Plug 'dhruvasagar/vim-table-mode'

" Syntax Plugins
" Polyglot hasn't failed me yet
Plug 'sheerun/vim-polyglot'
Plug 'dart-lang/dart-vim-plugin'

" File Tree
Plug 'tpope/vim-vinegar'
call plug#end()

"enable undo between file open/close
try
  set undodir=~/.vim/undodir
  set undofile
  set undolevels = 1000 "maximum number of changes that can be undone
  set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

" Fuzzy settings ctrl + p; ctrl + g
let g:ignore_list = 'yarn.lock\|bower_components\|node_modules\|\.git\|docs\|build\|dist\|image_results\|tmp\|gemini\|gemini_report\|tags'

"identify .es6 as javascript and tilt as python
au! BufEnter *.es6 set ft=javascript
au! BufEnter Tiltfile set ft=python

filetype plugin indent on

" turn on spell check for text files
augroup spelling
  au!
autocmd Filetype gitcommit setlocal spell textwidth=80
autocmd BufRead *.md setlocal spell textwidth=0
autocmd Filetype txt setlocal spell textwidth=0
augroup end

set textwidth=80

set viewoptions=cursor,folds,slash,unix

let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

syntax on
if (has("termguicolors"))
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   let &t_ZH="^[[3m"
   let &t_ZR="^[[23m"
   set termguicolors
endif
let g:forest_night_background = 'medium'
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1
colorscheme forest-night
set nocompatible
set t_Co=256
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType elm setlocal shiftwidth=4 tabstop=4

" center on space
nmap <space> zz
" delete(not cut) with d
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP

" helps avoid annoying typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" ctrl+w escapes you from a terminal
tnoremap <C-w> <C-\><C-n>

" what was that about sane defaults?
set mouse=""

" note taking
let g:table_mode_corner='|'

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" convert imports to requires with :ImportToRequire
fun! ImportToRequire()
  %s/\vimport(.*)from (.*);/const\1= require(\2);
endfun

let g:floaterm_opener='vsplit'
nnoremap <C-p> :FloatermNew fzf<CR>
nnoremap <C-g> :FloatermNew rg<CR>
nnoremap <C-b> :FloatermNew br<CR>
nnoremap <C-t> :FloatermToggle <CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>

" Aid for colorscheme creation \sp to get syntax names
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Load Lua Config
lua require('init')
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

autocmd BufEnter * lua require('completion').on_attach()
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_auto_change_source = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)" : "\<c-e>\<CR>" : "\<CR>"
