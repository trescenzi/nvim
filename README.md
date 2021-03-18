# NeoVim Config

This neovim config is intended to be rather lightweight while still providing
all of the modern flexibility one expects out of an editor and including some lua.
Using this config + [alacritty](https://github.com/jwilm/alacritty) I see 0 slowdowns.


## Plugins
- Colorscheme(s): 
  - [forest-night](https://github.com/sainnhe/forest-night)
- Terminal Popup: [floaterm](https://github.com/voldikss/vim-floaterm)
  - Fuzzy Search: [fzf](https://github.com/junegunn/fzf)
    - This requires you have fzf + rg installed on your system.
  - Tree Search: [broot](https://dystroy.org/broot/)
  - Popup Terminal
- Simple File Tree Helper: [vim-vinegar](https://github.com/tpope/vim-vinegar)
- Typeahead and Language Server: [nvim-lsp](https://github.com/neovim/nvim-lspconfig)
- Syntax support
  - Basically everything: [vim-polyglot]()
- Note Taking
  - Table Mode: [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)

## nvim LSP

The language server used with this config is neovim's nightly lsp. In order for it to function
correctly you need to be on the nightly version of neovim.

In order to work with different language servers you have to install them as specified [here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md). I typically have the following installed(and they are auto included by `init.lua`.

- python
- css
- svelte
- json
- rust
- go
- deno

### Normal Mode Commands
- `gd`: Jump to a symbol's definition
- `gD`: Jump to a declaration
- `k`:  Provide information about a symbol
- `gy`: Jump to a symbol's type definition
- `gi`: Jump to a symbol's implementation
- `gr`: Show a symbol's references
- `rn`: Rename a symbol

## Fuzzy Searching

Fuzzy searching is powered by [FZF](https://github.com/junegunn/fzf). I use FZF
+ [ripgrep](https://github.com/BurntSushi/ripgrep) for a super fast fuzzy
searching solution. They require a little more setup than just `ctrl+p` but it's
worth it. Check out
[How FZF and ripgrep improved my workflow](https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861)
to learn how to install them and more about why they are so great even outside
of vim.

floaterm adds a light wrapper around fzf & ripgrep commands. I've mapped some of the more used commands in normal mode to avoid
typing the commands. It also works well with broot for finding files in a tree structure.

## Remaps

- normal mode:
  - `<space>` -> zz: Hitting `<space>` will center the screen
  - `d` doesn't load the paste register. Use `x` to cut.
  - `-` opens `netrw`. This comes from `vim-vinegar`
  - `<C-t>`(Ctrl + t) toggles a floating terminal
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

## Todo
- [ ] Find a solid way to do zettelkasten note taking
- [ ] Fix tresitter
