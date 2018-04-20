call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'
Plug 'posva/vim-vue'

Plug 'elmcast/elm-vim'
Plug 'jparise/vim-graphql'
call plug#end()

try
  set undodir=~/.vim/undodir
  set undofile
  set undolevels = 1000 "maximum number of changes that can be undone
  set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

" neocomplecache
let g:deoplete#enable_at_startup = 1
" tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" tern deoplete show docs
let g:deoplete#sources#ternjs#types = 1
" tern use global tern
let g:tern#command = ['tern']

" tern mappings
" Tg -> open preview of definition of symbol
nnoremap Tg :TernDefPreview<CR>
" Tt -> show type of symbol
nnoremap Tt :TernType<CR>
" Tr -> show all refs of symbol
nnoremap Tr :TernRefs<CR>


let g:ctrlp_custom_ignore = 'X86*\|bower_components\|node_modules\|\.git\|docs\|build\|dist\|image_results\|tmp\|gemini\|gemini_report'

"identify .es6 as javascript
au! BufEnter *.es6 set ft=javascript

filetype plugin indent on

autocmd Filetype gitcommit setlocal spell textwidth=80

set textwidth=80

set viewoptions=cursor,folds,slash,unix

let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

syntax on
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
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
