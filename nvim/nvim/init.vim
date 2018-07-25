if &compatible
  set nocompatible               " Be iMproved
endif
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
so ~/.config/nvim/deinrc.vim
"Required:
filetype plugin indent on
filetype plugin on
syntax enable
set clipboard=unnamed

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set background=dark
colors gruvbox
"colors anderson
"colors flattened_dark
"colors hybrid
"colors hybrid_material
"colors OceanicNext
set laststatus=2
"For gitgutter
set updatetime=250
let g:gitgutter_map_keys = 0
set spell spelllang=en_us
hi SpellBad gui=underline guifg=red                                 
so ~/.config/nvim/statusline.vim                                    
                                                                    
"settings                                                           
let mapleader="\<SPACE>"                                            
set timeoutlen=1000 ttimeoutlen=0 "remove delay after tapping escape
let g:vimfiler_as_default_explorer = 1                              
let g:vimfiler_ignore_filters = ['matcher_ignore_pattern']
let g:vimfiler_quick_look_command = 'qlmanage -p'

let g:EasyMotion_do_mapping = 1
set nowrap
set termguicolors

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

":Topen open the terminal
":Ttoggle toggle
autocmd BufLeave term://* stopinsert

au BufRead,BufNewFile Podfile set filetype=ruby
autocmd BufNewFile,BufRead *.swift set filetype=swift
" When editing a file, always jump to the last cursor position
if has("autocmd")
   autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
     \ endif
endif
autocmd InsertLeave * call ClosePopup()

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden --ignore '
let g:unite_source_grep_recursive_opt = ''
let g:goldenview__enable_default_mapping = 0
" Use deoplete.                                                     
let g:deoplete#enable_at_startup = 1                                
function! ClosePopup()                                              
  if pumvisible()                                                   
    call deoplete#smart_close_popup()                               
  endif                                                             
endfunction                                                         

call deoplete#enable_logging('DEBUG', 'deoplete.log')
"Terminal stuff
tnoremap <ESC><ESC> <C-\><C-n>
"tnoremap <leader>h <C-\><C-n><C-w>h
"tnoremap <leader>j <C-\><C-n><C-w>j
"tnoremap <leader>k <C-\><C-n><C-w>k
"tnoremap <leader>l <C-\><C-n><C-w>l
"autocmd BufWinEnter,WinEnter term://* startinsert
"navigation
nmap <C-S-left> <C-o>
nmap <C-S-right> <C-i>
"windows
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l
nmap <silent> <leader>w <Plug>(choosewin)
" resize current buffer by +/- 5 
nnoremap <C-right> :vertical resize +5<cr>
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-up> :resize +5<cr>
nnoremap <C-down> :resize -5<cr>

nmap <silent> <leader>f :VimFilerExplorer -auto-cd<CR>
nmap <silent> <leader>ob :Unite -default-action=vimfiler_explorer bookmark<CR>
nmap <silent> <leader>r :Denite -buffer-name=MRU file_mru unite:directory_mru<CR>
nmap <silent> <leader>t :Denite -buffer-name=CTRLP file_rec<CR>
nmap <silent> <leader>/ :Denite grep:.<CR>
nmap <silent> <leader>gs :Gstatus <bar>wincmd T<bar>set previewwindow<CR>
nmap <silent> <leader>s <Plug>TilerNew
nmap <silent> <leader>m <Plug>TilerFocus
nmap <silent> <leader>i V=<ESC>
vmap <silent> <leader>i =
nmap <silent> <leader>eb :VimFilerBuffer -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
nmap <silent> <leader>v :Ttoggle<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map f/ <Plug>(incsearch-fuzzy-/)
map f? <Plug>(incsearch-fuzzy-?)
map fg/ <Plug>(incsearch-fuzzy-stay)

let test#strategy = 'neoterm'
let g:test#python#pytest#options = '-s'

nnoremap <silent> <leader>U :TestNearest<CR>
nnoremap <silent> <leader>u :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>

autocmd FileType vimfiler call s:unite_settings()
autocmd FileType vimfiler call s:vimfiler_settings()
autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  unmap <buffer> <Space>
endfunction

function! s:vimfiler_settings()
  nnoremap <buffer><silent><expr> b vimfiler#do_action('bookmark')
  nunmap <buffer> v
  nmap <buffer>v <Plug>(vimfiler_quick_look)
  nunmap <buffer> <C-l>
  nmap <buffer> R <Plug>(vimfiler_redraw_screen)
  nunmap <buffer> *
  nmap <buffer> <silent> * <Plug>(vimfiler_toggle_mark_current_line)
  unmap <buffer> E
  nmap <buffer> <silent> s <Plug>(vimfiler_split_edit_file)
  nmap <buffer> <Enter> <Plug>(vimfiler_expand_or_edit)
  nmap <buffer> cd <Plug>(vimfiler_cd_or_edit)

endfunction

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap' )
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap' )
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
autocmd! BufWritePost,BufEnter * Neomake
hi Search gui=NONE guibg=#606060 guifg=NONE
set guicursor+=a:blinkon1
hi! link IncSearch Search

"cabbrev wqa <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'w\|close' : 'wqa')<CR>
"cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>

"nvr
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif


"vex
nnoremap <Tab> /<#<CR>:nohlsearch<cr>va<
vnoremap <Tab> <Esc>/<#<CR>:nohlsearch<cr>va<
autocmd BufReadPost *.swift call deoplete#enable_logging('DEBUG', 'deoplete.log')
autocmd BufReadPost *.swift call deoplete#custom#source('Swift', 'debug_enabled', 1)

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

let explorer = {  'is_selectable' : 1,  }
function! explorer.func(candidates)
  execute ':VimFilerExplorer -no-toggle ' . a:candidates[0].action__path
endfunction
call unite#custom#action('cdable', 'vimfiler_explorer', explorer)
unlet explorer
