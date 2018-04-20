# Javascript NeoVim Config

This is the NeoVim config I use for javascript development. It's intended to
provide a few nice to haves when working with javascript. Tern is included as
something that adds some more powerful features if desired. It's very well
hidden if not desired.

## Plugins
- Colorscheme: [gruvbox](https://github.com/morhetz/gruvbox)
- Fuzzy Search: [ctrlp](https://github.com/kien/ctrlp.vim)
- Simple File Tree Helper: [vim-vinegar](https://github.com/tpope/vim-vinegar)
- Enhanced JS Highlighting: [vim-javascript](https://github.com/pangloss/vim-javascript)
- Typeahead(with <TAB> key setup): [deoplete](https://github.com/Shougo/deoplete.nvim)
  - Symbol specific typeahead(with type descriptions): [deoplete-ternjs](https://github.com/carlitux/deoplete-ternjs)
- Symbol file jumping: [ternjs-vim](https://github.com/ternjs/tern_for_vim)
- Vue file support: [vim-vue](https://github.com/posva/vim-vue)
- Elm support: [vim-elm](https://github.com/ElmCast/elm-vim)
- GraphQL Syntax Highlighting: [vim-graphql](https://github.com/jparise/vim-graphql)

## Tern

Tern provides the ability for deoplete to show symbol definitions and provide
typeahead of symbols. This is provided seamlessly when typing. An exaple config
is included in this project. Place it in `~` for use.

Tern also provides the ability to jump from symbol to symbol definition, show
the current symbol's type, and list out where the current symbol is being used.
Mappings to these commands are:

- `Tg`: open the file where the symbol under the cursor is defined
- `Tt`: display the type of the symbol under the cursor in the status bar
- `Tr`: show refs of the symbol under the cursor

Note while well meaning Tern doesn't always get everything right. `vim-vinegar`
+ `grep` + `ctrlp` solve most symbol searching problems.

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
