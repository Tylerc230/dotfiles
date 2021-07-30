if &compatible
  set nocompatible               " Be iMproved
endif
set hidden
" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on
colorscheme nvcode " Or whatever colorscheme you make
set clipboard=unnamed
hi ColorColumn ctermbg=0 guibg=#363636
"highlight Normal guibg=none
set laststatus=2
set updatetime=250
set nospell spelllang=en_us
hi SpellBad gui=underline guifg=red                                 
set timeoutlen=1000 ttimeoutlen=0 "remove delay after tapping escape
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
autocmd FileType fugitive set spell
autocmd FileType text, markdown set spell

" When editing a file, always jump to the last cursor position
if has("autocmd")
   autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
     \ endif
endif


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


hi Search gui=NONE guibg=#606060 guifg=NONE
set guicursor+=a:blinkon1
hi! link IncSearch Search
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif


function! FugitiveReDetect()
  unlet! b:git_dir
  call FugitiveDetect(getcwd())
endfunction

augroup fugitive-ov
  au BufEnter * call FugitiveReDetect()
  au BufNew * call FugitiveReDetect()
  au BufNewFile * call FugitiveReDetect()
  au BufRead * call FugitiveReDetect()
  au CmdwinEnter * call FugitiveReDetect()
  au DirChanged * call FugitiveReDetect()
  au VimEnter * call FugitiveReDetect()
augroup END


let g:neoterm_default_mod = 'botright'
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_open_in_all_tabs = 1 "open an new terminal for each tab instead of using the same one
let g:neoterm_term_per_tab = 1 "send commands to current tab terminal instead of last active
autocmd BufLeave term://* stopinsert
autocmd FileType neoterm  set nospell
autocmd FileType neoterm  nnoremap <silent><buffer> q :Tclose<CR>
tnoremap <ESC> <C-\><C-n>



au BufRead,BufNewFile Podfile set filetype=ruby
au BufRead,BufNewFile Fastfile set filetype=ruby
au BufRead,BufNewFile *.podspec set filetype=ruby
au BufRead,BufNewFile *.ino set filetype=cpp

"navigation
nnoremap <C-i> <C-o>
nnoremap <C-o> <C-i>
