# NeoVim Config

This neovim config is intended to be rather lightweight while still providing
all of the modern flexibility one expects out of an editor and including some lua.
Using this config + [alacritty](https://github.com/jwilm/alacritty) I see 0 slowdowns.

## Plugins
Plugins are managed with [paq](https://github.com/savq/paq-nvim).
On the first run paq will be cloned and install packages. Stuff will complain
and look a bit gross. Run `:COQdeps`, it'll shout at you to, then restart.

- Colorscheme:
  - [everforest](https://github.com/sainnhe/everforest)
- Terminal Popup: [floaterm](https://github.com/voldikss/vim-floaterm)
  - Provides fuzzy searching with fzf(files) and rg(full test)
    - This requires you have fzf + rg installed on your system.
- File exploring with raw netrw and `-` to explore in normal mode
- Language Server: [nvim-lsp](https://github.com/neovim/nvim-lspconfig)
- Completion: [nvim_coq](https://github.com/ms-jpq/coq_nvim)

## nvim LSP

The language server used with this config is neovim's nightly lsp. In order for it to function
correctly you need to be on nvim 0.5+.

In order to work with different language servers you have to install them as specified [here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md). I typically have the following installed(and they are auto included by `init.lua`.

- python
- css
- svelte
- json
- rust
- go
- tsserver

### Normal Mode Commands
- `gd`: Jump to a symbol's definition
- `gD`: Jump to a declaration
- `k`:  Provide information about a symbol
- `gy`: Jump to a symbol's type definition
- `gi`: Jump to a symbol's implementation
- `gr`: Show a symbol's references
- `rn`: Rename a symbol

## Fuzzy Searching

Fuzzy searching is powered by [FZF](https://github.com/junegunn/fzf). I use FZF & [ripgrep](https://github.com/BurntSushi/ripgrep) for a super fast fuzzy
searching solution.
[How FZF and ripgrep improved my workflow](https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861) to learn how to install them and more about why they are so great even outside of vim.

floaterm adds a light wrapper around fzf & ripgrep commands. I've mapped some of the more used commands in normal mode to avoid
typing the commands.

## Remaps

- normal mode:
  - `<space>` -> zz: Hitting `<space>` will center the screen
  - `d` doesn't load the paste register. Use `x` to cut.
  - `-` opens `netrw` in the current buffer's directory.
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

## Performance

Generally the goal of this config is to be as simple and performant while also
providing a whole bunch of features that you'd expect. Measurments were taken
with [vim-startuptime](https://github.com/rhysd/vim-startuptime).

On an M1 Pro(early 2021) the startup times look like:

```
Total Average: 30.380570 msec
Total Max:     31.342000 msec
Total Min:     29.877000 msec
```

On a Raspberry PI 3+ they look like:

```
Total Average: 645.070000 msec
Total Max:     659.729000 msec
Total Min:     555.546000 msec
```
