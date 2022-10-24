vim.g.floaterm_opener="edit"

nnmap("<C-p>", ":FloatermNew fzf <CR>")
nnmap("<C-g>", ":FloatermNew rg .<CR>")
nnmap("<C-t>", ":FloatermToggle <CR>")
