call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'shougo/neocomplcache'
Plug 'pangloss/vim-javascript'
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

" turn on jscs and jshint for neomake
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
" run neomake on save and open
au! BufWritePost * Neomake
au! BufEnter * Neomake

let g:ctrlp_custom_ignore = 'X86*\|bower_components\|node_modules\|\.git\|docs\|build\|dist'

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

