call plug#begin('~/.config/nvim/plugged')
" Pretty Colors
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Fuzzy Completion via FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Completion + Language Server
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Syntax Plugins
" Polyglot hasn't failed me yet
Plug 'sheerun/vim-polyglot'
"Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
"Plug 'hashivim/vim-terraform'
"Plug 'mxw/vim-jsx'
"Plug 'jparise/vim-graphql'
"Plug 'elixir-editors/vim-elixir'
"Plug 'posva/vim-vue'
"Plug 'elmcast/elm-vim'

" Extensions
  " File Tree
  Plug 'tpope/vim-vinegar'
  " Status Line
  Plug 'itchyny/lightline.vim'
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
nnoremap <C-p> :FZF<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-b> :Buffer<CR>

"identify .es6 as javascript
au! BufEnter *.es6 set ft=javascript
au! BufEnter Tiltfile set ft=python

filetype plugin indent on

augroup spelling
  au!
autocmd Filetype gitcommit setlocal spell textwidth=80
autocmd Filetype md setlocal spell textwidth=0
autocmd Filetype txt setlocal spell textwidth=0
augroup end

augroup svelte
  au!
  autocmd BufNewFile,BufRead *.svelte   set syntax=vue
augroup END


set textwidth=80

set viewoptions=cursor,folds,slash,unix

let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

syntax on
set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
set nocompatible
set t_Co=256
set number
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

let g:lightline = {'colorscheme' : 'gruvbox_material'}

autocmd FileType elm setlocal shiftwidth=4 tabstop=4

nmap <space> zz
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP

tnoremap <C-w> <C-\><C-n>

" what was that about sane defaults?
set mouse=""

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" convert imports to requires with :ImportToRequire
fun! ImportToRequire()
  %s/\vimport(.*)from (.*);/const\1= require(\2);
endfun

" coc options
" go to definition with gd
nmap <silent> gd <Plug>(coc-definition)
" go to type definition with gy
nmap <silent> gy <Plug>(coc-type-definition)
" go to implementation(ts) with gi
nmap <silent> gi <Plug>(coc-implementation)
" find references with gi
nmap <silent> gr <Plug>(coc-references)
" use language server to rename with rn
nmap <leader>rn <Plug>(coc-rename)

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

" Prettify file with gp
nnoremap gp :silent %!yarn prettier --stdin --stdin-filepath % --trailing-comma all --single-quote<CR>
