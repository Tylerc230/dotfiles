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
hi ColorColumn ctermbg=0 guibg=#363636
highlight Normal guibg=none
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
set exrc                " Source _nvimrc in local folder
set undofile " Maintain undo history between sessions
set undodir=~/.cache/undodir
set signcolumn=yes

"Auto reload buffer if it changes on disk
set autoread            
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FileType denite  set nospell
autocmd FileType fugitive set spell

" When editing a file, always jump to the last cursor position
if has("autocmd")
   autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
     \ endif
endif

