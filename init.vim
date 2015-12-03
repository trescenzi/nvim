call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'shougo/neocomplcache'
Plug 'benekastah/neomake'
Plug 'rust-lang/rust.vim'
call plug#end()

try
  set undodir=~/.vim/undodir
  set undofile
  set undolevels = 1000 "maximum number of changes that can be undone
  set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

" neocomplecache
let g:neocomplcache_enable_at_startup = 1
" tab completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neomake_javascript_enabled_makers = ['jshint']
au! BufWritePost * Neomake
au! BufEnter * Neomake

"identify .es6 as javascript
au! BufEnter *.es6 set ft=javascript

filetype plugin indent on

syntax on
set background=dark
colorscheme solarized
set nocompatible
set t_Co=256
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

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

