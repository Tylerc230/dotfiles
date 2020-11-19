
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
nmap <silent> <leader>gs :Gstatus<CR>
