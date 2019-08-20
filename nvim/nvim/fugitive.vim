
function! FugitiveReDetect()
  unlet! b:git_dir
  call fugitive#detect(getcwd())
endfunction

augroup fugitive-ov
  au BufEnter term://* call fugitive#detect(@%)
  au BufNew * call FugitiveReDetect()
  au BufNewFile * call FugitiveReDetect()
  au BufRead * call FugitiveReDetect()
  au CmdwinEnter * call FugitiveReDetect()
  au DirChanged * bufdo call FugitiveReDetect()
  au VimEnter * call FugitiveReDetect()
augroup END
nmap <silent> <leader>gs :Gstatus<CR>
