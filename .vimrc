set number
set hlsearch
set incsearch
set list
set nocompatible
set listchars=tab:>.,trail:.,extends:#,nbsp:.

call pathogen#infect()

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


" Theme
set laststatus=2
set t_Co=256
colorscheme Tomorrow-Night

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.space="\ua0"
let g:airline_left_sep='>'
let g:airline_right_sep='>'
let g:airline_detect_iminsert=1
let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline#extensions#tabline#enabled=1
