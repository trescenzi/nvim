call plug#begin('~/.config/nvim/plugged')
" Pretty Colors
Plug 'morhetz/gruvbox'

" Fuzzy Completion via FZY
Plug 'nannery/neovim-fuzzy'

" Completion + Language Server
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Syntax Plugins
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
"Plug 'posva/vim-vue'
"Plug 'elmcast/elm-vim'

" Extensions
  " File Tree
  Plug 'tpope/vim-vinegar'
  " Note Taking
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-misc'
  Plug 'dhruvasagar/vim-table-mode'
call plug#end()

try
  set undodir=~/.vim/undodir
  set undofile
  set undolevels = 1000 "maximum number of changes that can be undone
  set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

" Fuzzy settings ctrl + p; ctrl + g
let g:ignore_list = 'yarn.lock\|bower_components\|node_modules\|\.git\|docs\|build\|dist\|image_results\|tmp\|gemini\|gemini_report\|tags'
nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-g> :FuzzyGrep<CR>

"identify .es6 as javascript
au! BufEnter *.es6 set ft=javascript
au! BufEnter Tiltfile set ft=python

filetype plugin indent on

autocmd Filetype gitcommit setlocal spell textwidth=80
autocmd Filetype md setlocal spell textwidth=0
autocmd Filetype txt setlocal spell textwidth=0

" MD compatible tables
let g:table_mode_corner='|:'

set textwidth=80

set viewoptions=cursor,folds,slash,unix

let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

syntax on
set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
set nocompatible
set t_Co=256
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType elm setlocal shiftwidth=4 tabstop=4

nmap <space> zz
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP

tnoremap <C-w> <C-\><C-n>

" what was that about sane defaults?
set mouse=""

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  "     " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

fun! ImportToRequire()
  %s/\vimport(.*)from (.*);/const\1= require(\2);
endfun

" Notes options
" Save as txt to dropbox + keybase
let g:notes_suffix='.txt'
let g:notes_directories = ['~/Dropbox/notes', '~/Library/Application Support/Keybase/Keybase/private/trescenzi/notes']

" coc options
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
set cmdheight=2
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
