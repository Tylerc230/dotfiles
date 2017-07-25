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

autocmd BufNewFile,BufRead *.swift set filetype=swift
" Jump to the first placeholder by typing `<C-k>`.
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
" When editing a file, always jump to the last cursor position
if has("autocmd")
   autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
     \ endif
endif

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden --ignore '
let g:unite_source_grep_recursive_opt = ''
let g:goldenview__enable_default_mapping = 0
" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr><ESC>  pumvisible() ? deoplete#smart_close_popup() : "\<ESC>"
"Terminal stuff
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l
autocmd BufWinEnter,WinEnter term://* startinsert
"mappings
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l
nmap <silent> <leader>f :VimFilerExplorer<CR>
nmap <silent> <leader>r :Denite -buffer-name=MRU file_mru unite:directory_mru<CR>
nmap <silent> <leader>t :Denite -buffer-name=CTRLP file_rec<CR>
nmap <silent> <leader>/ :Denite grep:.<CR>
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gl :Gitv<CR>
nmap <silent> <leader>s <Plug>GoldenViewSplit
nmap <silent> <leader>m <Plug>GoldenViewSwitchMain
nmap <silent> <leader>i V=<ESC>
vmap <silent> <leader>i =
nmap <silent> <leader>eb :VimFilerBuffer -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>

autocmd FileType vimfiler call s:unite_settings()
autocmd FileType vimfiler call s:vimfiler_settings()
autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  unmap <buffer> <Space>
endfunction

function! s:vimfiler_settings()
  unmap <buffer> E
  nmap <buffer> <silent> s <Plug>(vimfiler_split_edit_file)
  nmap <buffer> <Enter> o
  nmap <buffer> cd <Plug>(vimfiler_cd_or_edit)
endfunction

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap' )
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap' )
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
autocmd! BufWritePost,BufEnter * Neomake


