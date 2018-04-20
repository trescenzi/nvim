# Javascript NeoVim Config

This is the NeoVim config I use for javascript development. It's intended to
provide a few nice to haves while not being overly complex. Deoplete-ternjs is
by far the most complex part and isn't required. Configuration of it is really
simple though.

## Plugins
- Colorscheme: [gruvbox](https://github.com/morhetz/gruvbox)
- Fuzzy Search: [ctrlp](https://github.com/kien/ctrlp.vim)
- Simple File Tree Helper: [vim-vinegar](https://github.com/tpope/vim-vinegar)
- Enhanced JS Highlighting: [vim-javascript](https://github.com/pangloss/vim-javascript)
- Typeahead(with <TAB> key setup): [deoplete](https://github.com/Shougo/deoplete.nvim)
  - Symbol specific typeahead(with type descriptions): [deoplete-ternjs](https://github.com/carlitux/deoplete-ternjs)
- Vue file support: [vim-vue](https://github.com/posva/vim-vue)
- Elm support: [vim-elm](https://github.com/ElmCast/elm-vim)
- GraphQL Syntax Highlighting: [vim-graphql](https://github.com/jparise/vim-graphql)

## Remaps

- normal mode:
  - `<space>` -> zz: Hitting `<space>` will center the screen
  - `d` doesn't load the paste register. Use `x` to cut.
- terminal mode:
  - `<C-w>`(Ctrl + w) -> leave terminal insert mode

## Misc Settings
- 80 char width
- gitcommits have spell check turned on
- mouse is turned off
- `netrw`:
  - Read only
  - Line numbers on
  - List style 3(file tree)
- Very large undo buffer
