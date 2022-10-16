autocmd BufRead * silent! :normal `.

lua << EOF
  require('bootstrap')
  require('init')
EOF
