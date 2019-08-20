" Use deoplete.                                                     
let g:LanguageClient_autoStart = 1
let g:LanguageClient_useVirtualText = 0
let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')
let g:LanguageClient_loggingFile = expand('~/.config/nvim/LanguageClient.log')
let g:LanguageClient_loggingLevel = "DEBUG"

let g:deoplete#enable_at_startup = 1                                
call deoplete#custom#option('auto_complete_delay', 250)
"call deoplete#enable_logging('DEBUG', 'deoplete.log')
"call deoplete#custom#option('profile', v:true)

      "\'cpp': ['~/tools/cquery/build/cquery', '--log-file=/tmp/cq.log'],
      "\'c': ['~/tools/cquery/build/cquery', '--log-file=/tmp/cq.log'],
      "\'objc': ['~/tools/cquery/build/cquery', '--log-file=/tmp/cq.log'],
let g:LanguageClient_serverCommands = {
      \'python': ['/usr/local/bin/pyls'],
      \'swift': ['~/tools/sourcekit-lsp/.build/debug/sourcekit-lsp'],
      \}
let g:LanguageClient_rootMarkers = {
      \ 'swift': ['Package.swift'],
      \ }
let g:delimitMate_expand_cr = 0
inoremap <expr> <Esc> pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"
imap <expr> <CR>  pumvisible() ? "\<C-y>" : "<Plug>delimitMateCR"
function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> gi :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> <leader>gm :Denite contextMenu<cr>
    nnoremap <buffer> <silent> <leader>m :Denite documentSymbol<cr>
    nnoremap <buffer> <silent> <leader>gr :Denite references<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()
