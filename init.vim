call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'nannery/neovim-fuzzy'
Plug 'tpope/vim-vinegar'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"Plug 'lifepillar/vim-mucomplete'
Plug 'ternjs/tern_for_vim'
Plug 'craigemery/vim-autotag'
Plug 'w0rp/ale'
Plug 'rizzatti/dash.vim'

"Plug 'posva/vim-vue'
"Plug 'elmcast/elm-vim'
Plug 'jparise/vim-graphql'

Plug 'dhruvasagar/vim-table-mode'

Plug 'leafgarland/typescript-vim'
Plug 'hashivim/vim-terraform'

Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
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

" mucomplete
"set completeopt+=menuone
"autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" tern mappings
" Tg -> open preview of definition of symbol
nnoremap Tg :TernDefPreview<CR>
" Tt -> show type of symbol
nnoremap Tt :TernType<CR>
" Tr -> show all refs of symbol
nnoremap Tr :TernRefs<CR>


"let g:ctrlp_custom_ignore = 'X86*\|bower_components\|node_modules\|\.git\|docs\|build\|dist\|image_results\|tmp\|gemini\|gemini_report\|tags'
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

:nmap <silent> <leader>d <Plug>DashSearch

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

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Notes options
let g:notes_suffix='.txt'
let g:notes_directories = ['~/Dropbox/notes', '~/Library/Application Support/Keybase/Keybase/private/trescenzi/notes']
