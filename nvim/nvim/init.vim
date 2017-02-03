if &compatible
  set nocompatible               " Be iMproved
endif
so ~/.config/nvim/deinrc.vim
"Required:
filetype plugin indent on
filetype plugin on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set background=dark
"colors gruvbox
"colors anderson
colors flattened_dark
"colors hybrid
"colors hybrid_material
"colors OceanicNext
set laststatus=2
"For gitgutter
set updatetime=250
let g:gitgutter_map_keys = 0
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
set esckeys             " Cursor keys in insert mode.
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
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:vimfiler_no_default_key_mappings = 1
let g:goldenview__enable_default_mapping = 0

"mappings
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l
nmap <silent> <leader>f :VimFilerExplorer<CR>
nmap <silent> <leader>r :Unite -buffer-name=MRU -no-split file_mru directory_mru<CR>
nmap <silent> <leader>t :Unite -no-split -start-insert -buffer-name=CTRLP file_rec/neovim<CR>
nmap <silent> <leader>/ :Unite grep:.<CR>
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gl :Gitv<CR>
nmap <silent> <leader>s <Plug>GoldenViewSplit
nmap <silent> <leader>m <Plug>GoldenViewSwitchMain
nmap <silent> <leader>i V=<ESC>
vmap <silent> <leader>i =

autocmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
  nmap <buffer> <silent> j			<Plug>(vimfiler_loop_cursor_down)
  nmap <buffer> <silent> k			<Plug>(vimfiler_loop_cursor_up)
  nmap <buffer> <silent> s			<Plug>(vimfiler_split_edit_file)
  "gg			<Plug>(vimfiler_cursor_top)
  "<Plug>(vimfiler_switch_to_other_window)
  "<Space>			<Plug>(vimfiler_toggle_mark_current_line)
  "U			<Plug>(vimfiler_clear_mark_all_lines)
  "c			<Plug>(vimfiler_copy_file)
  "m			<Plug>(vimfiler_move_file)
  "d			<Plug>(vimfiler_delete_file)
  "r			<Plug>(vimfiler_rename_file)
  "K			<Plug>(vimfiler_make_directory)
  "N			<Plug>(vimfiler_new_file)
  "<Enter>			<Plug>(vimfiler_cd_or_edit)
  nmap <buffer> <silent> o			<Plug>(vimfiler_expand_or_edit)
  "<C-j>			<Plug>(vimfiler_switch_to_history_directory)
  nmap<buffer> <silent> <BS>			<Plug>(vimfiler_switch_to_parent_directory)
  nmap <buffer> <silent> .			<Plug>(vimfiler_toggle_visible_ignore_files)
  "e			<Plug>(vimfiler_edit_file)
  "E			<Plug>(vimfiler_split_edit_file)
  "q			<Plug>(vimfiler_hide)
  "g?			<Plug>(vimfiler_help)
  "v			<Plug>(vimfiler_preview_file)

  "a			<Plug>(vimfiler_choose_action)
endfunction
