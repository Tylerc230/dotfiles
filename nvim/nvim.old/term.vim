
let test#strategy = 'neoterm'
let test#python#runner = 'pytest'
let g:test#python#pytest#options = '-s'



let g:neoterm_default_mod = 'botright'
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_open_in_all_tabs = 1 "open an new terminal for each tab instead of using the same one
let g:neoterm_term_per_tab = 1 "send commands to current tab terminal instead of last active
nmap <silent> <leader>v :Ttoggle<CR>
nmap <silent> <leader>n :vert Tnew<CR>

nnoremap <silent> <leader>U :TestNearest<CR>
nnoremap <silent> <leader>u :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>
":Topen open the terminal
":Ttoggle toggle
autocmd BufLeave term://* stopinsert
autocmd FileType neoterm  set nospell
autocmd FileType neoterm  nnoremap <silent><buffer> q :Tclose<CR>
tnoremap <ESC> <C-\><C-n>
"tnoremap <leader>h <C-\><C-n><C-w>h
"tnoremap <leader>j <C-\><C-n><C-w>j
"tnoremap <leader>k <C-\><C-n><C-w>k
"tnoremap <leader>l <C-\><C-n><C-w>l
"autocmd BufWinEnter,WinEnter term://* startinsert
