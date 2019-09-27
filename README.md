# NeoVim Config

This neovim config is intended to be rather lightweight while still providing
all of the modern flexibility one expects out of an editor. Using this config +
[alacritty](https://github.com/jwilm/alacritty) I see 0 slowdowns.


## Plugins
- Colorscheme(s): 
  - [gruvbox](https://github.com/morhetz/gruvbox)
  - [gruvbox-material](https://github.com/sainnhe/gruvbox-material)
- Fuzzy Search: [fzf](https://github.com/junegunn/fzf.vim)
  - This requires you have fzf + rg installed on your system.
- Simple File Tree Helper: [vim-vinegar](https://github.com/tpope/vim-vinegar)
- Typeahead and Language Server: [coc](https://github.com/neoclide/coc.nvim)
- Syntax support
  - Basically everything: [vim-polyglot]()
  - Enhanced JS Highlighting: [vim-javascript](https://github.com/pangloss/vim-javascript)
- Status Line: [lightline.vim](https://github.com/itchyny/lightline.vim)

## CoC

CoC provides language server support. This includes:
- Typeahead
- Symbol based file jumping and renaming
- Suggestions and documentation for functions while typing

In order for CoC to work for languages you're working with you need to install
the language server or CoC extension that supports that language. You can find
all extensions [here](https://github.com/neoclide/coc.nvim#extensions). The
extensions I use for web development are:
- coc-json
- coc-html
- coc-css
- coc-tsserver

To install all of these use: `:CocInstall coc-json coc-html coc-css coc-tsserver`

### Normal Mode Commands
- `gd`: Jump to a symbol's definition
- `gy`: Jump to a symbol's type definition
- `gi`: Jump to a symbol's implementation
- `gr`: Show a symbol's references
- `rn`: Rename a symbol

## FZY

Fuzzy searching is powered by [FZF](https://github.com/junegunn/fzf). I use FZF
+ [ripgrep](https://github.com/BurntSushi/ripgrep) for a super fast fuzzy
searching solution. They require a little more setup than just `ctrl+p` but it's
worth it. Check out
[How FZF and ripgrep improved my workflow](https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861)
to learn how to install them and more about why they are so great even outside
of vim.

[fzf.vim](https://github.com/junegunn/fzf.vim) adds a light wrapper around fzf's
commands. I've mapped some of the more used commands in normal mode to avoid
typing the commands.

- `ctrl+p` -> `:FZF`: fuzzy file searching
- `ctrl+g` -> `:Rg`: fuzzy full text(within file) searching
- `ctrl+b` -> `:Buffer`: fuzzy buffer searching

## Remaps

- normal mode:
  - `<space>` -> zz: Hitting `<space>` will center the screen
  - `d` doesn't load the paste register. Use `x` to cut.
  - `-` opens `netrw`. This comes from `vim-vinegar`
- terminal mode:
  - `<C-w>`(Ctrl + w) -> leave terminal insert mode

## Misc Settings
- 80 char width
- gitcommits and md have spell check turned on
- mouse is turned off
- `netrw`:
  - Read only
  - Line numbers on
  - List style 3(file tree)
- Very large undo buffer
