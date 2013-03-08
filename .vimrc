set number
set hlsearch
set incsearch
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

fun! <SID>StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  let s = @/
  %s/\s\+$//e
  call cursor(l, c)
  let @/ = s
endfun

if has("autocmd")
  " Drupal ]= *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module setlocal filetype=php
    autocmd BufRead,BufNewFile *.install setlocal filetype=php
    autocmd BufRead,BufNewFile *.test setlocal filetype=php
  augroup END
  autocmd FileType python,javascript,php autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespace()
endif

filetype plugin on

let mapleader=","

nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>
nmap <silent> <Leader>/ :nohlsearch<CR>
