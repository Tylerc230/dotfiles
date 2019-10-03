au BufRead,BufNewFile Podfile set filetype=ruby
au BufRead,BufNewFile Fastfile set filetype=ruby
au BufRead,BufNewFile *.podspec set filetype=ruby

"navigation
nnoremap <C-i> <C-o>
nnoremap <C-o> <C-i>
cnoreabbrev wb w <bar> bp <bar> bd #
"windows
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
nnoremap <silent> <leader>w :ChooseWin<cr>
" resize current buffer by +/- 5 
nnoremap <C-right> :vertical resize +5<cr>
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-up> :resize +5<cr>
nnoremap <C-down> :resize -5<cr>
nmap <silent> U :UndotreeToggle<cr>
"format selection
nmap <silent> <leader>i V=<ESC> 
vmap <silent> <leader>i =
"copy file path to clipboard
nmap <silent> <leader>cp :let @+ = expand("%")<cr>
au FileType json nmap <silent> <leader>i :%!python -m json.tool<CR>
au FileType yaml nmap <silent> <leader>i :YAMLFormat<CR>

nnoremap <silent> <leader> <leader> / :let @/=""<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map f/ <Plug>(incsearch-fuzzy-/)
map f? <Plug>(incsearch-fuzzy-?)
map fg/ <Plug>(incsearch-fuzzy-stay)
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
hi Search gui=NONE guibg=#606060 guifg=NONE
set guicursor+=a:blinkon1
hi! link IncSearch Search
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
"vex
"nnoremap <Tab> /<#<CR>:nohlsearch<cr>va<
"vnoremap <Tab> <Esc>/<#<CR>:nohlsearch<cr>va<
"autocmd BufReadPost *.swift call deoplete#enable_logging('DEBUG', 'deoplete.log')
"autocmd BufReadPost *.swift call deoplete#custom#source('Swift', 'debug_enabled', 1)
"intero
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>it <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>iT <Plug>InteroType
  "au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>gd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Execute 'cmd' while redirecting output.
" Delete all lines that do not match regex 'filter' (if not empty).
" Delete any blank lines.
" Delete '<whitespace><number>:<whitespace>' from start of each line.
" Display result in a scratch buffer.
function! s:Filter_lines(cmd, filter)
  let save_more = &more
  set nomore
  redir => lines
  silent execute a:cmd
  redir END
  let &more = save_more
  new
  setlocal buftype=nofile bufhidden=hide noswapfile
  put =lines
  g/^\s*$/d
  %s/^\s*\d\+:\s*//e
  if !empty(a:filter)
    execute 'v/' . a:filter . '/d'
  endif
  0
endfunction
command! -nargs=? Scriptnames call s:Filter_lines('scriptnames', <q-args>)

filetype plugin indent on
filetype plugin on
syntax enable

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>

