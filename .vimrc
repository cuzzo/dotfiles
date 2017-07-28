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

" colorcolumn
fun! <SID>LineLimit(count)
  if exists('+colorcolumn')
    let &colorcolumn=a:count
  else
    au BufWinEnter * let w:m2=matchadd("ErrorMsg", "\%>" a:count "v.\+", -1)
  endif
endfun

if has("autocmd")
  autocmd FileType python,javascript,php,ruby,lua,elixir autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespace()
  autocmd FileType python :call <SID>LineLimit(79)
  autocmd FileType javascript,php,ruby,lua :call <SID>LineLimit(80)
  autocmd FileType html setlocal spell
endif

filetype plugin on

let mapleader=","

nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>
nmap <silent> <Leader>/ :nohlsearch<CR>

inoremap jj <Esc>

" Theme
set laststatus=2
set t_Co=256
colorscheme Tomorrow-Night

if !exists("g:airline_symbols")
  let g:airline_symbols={}
endif
let g:airline_symbols.space="\ua0"
let g:airline_left_sep=">"
let g:airline_right_sep=">"
let g:airline_detect_iminsert=1
let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline#extensions#tabline#enabled=1

" ctrlp
let g:ctrlp_custom_ignore = "node_modules"
