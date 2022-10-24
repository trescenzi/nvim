require('gitblame')

vim.g.gitblame_enabled = 0;
nnmap("<Leader>b", ":GitBlameToggle<CR>")
nnmap("<Leader>g", ":GitBlameOpenCommitURL<CR>")
nnmap("<Leader>c", ":GitBlameCopySHA<CR>")
