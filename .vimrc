set number

set tabstop=2
if has("autocmd")
  " Drupal ]= *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
  autocmd BufWritePre *.module,*.install,*.inc,*.test :%s/\s\+$//e
endif

syntax on
filetype plugin on
