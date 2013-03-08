set number
set hlsearch
set incsearch
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

if has("autocmd")
  " Drupal ]= *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
  autocmd BufWritePre *.module,*.install,*.inc,*.test :%s/\s\+$//e
endif

filetype plugin on

let mapleader=","

nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>
nmap <silent> <Leader>/ :nohlsearch<CR>
