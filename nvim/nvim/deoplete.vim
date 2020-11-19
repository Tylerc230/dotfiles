" Use deoplete.                                                     
let g:LanguageClient_autoStart = 1
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = expand('~/.config/nvim/settings.json')

let g:deoplete#enable_at_startup = 1                                
call deoplete#custom#option('auto_complete_delay', 250)
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
"Debug stuff
"let g:LanguageClient_loggingFile = expand('~/.config/nvim/LanguageClient.log')
"call deoplete#enable_logging('Debug', expand('~/.config/nvim/deoplete.log'))
"call deoplete#custom#option('profile', v:true)
let g:LanguageClient_loggingLevel = "INFO"
let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'

"\'cpp': ['/usr/local/opt/llvm/bin/clangd', '--query-driver', '/Users/tyler/Library/Arduino15/packages/arduino/tools/arm-none-eabi-gcc'],
let g:LanguageClient_serverCommands = {
      \'cpp': ['/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clangd'],
      \'python': ['/usr/local/bin/pyls'],
      \'swift': ['/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin/sourcekit-lsp',
      \ '-Xswiftc', '-sdk',
      \ '-Xswiftc', '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator13.0.sdk',
      \ '-Xswiftc', '-target',
      \ '-Xswiftc', 'x86_64-apple-ios13-simulator']
      \}

call deoplete#custom#option('sources', {
      \'swift': ['LanguageClient'],
      \'cpp': ['LanguageClient']
\})

let g:LanguageClient_rootMarkers = {
      \ 'swift': ['Package.swift'],
      \ 'cpp': ['compile_commands.json', 'compile_flags.txt']
      \ }
let g:delimitMate_expand_cr = 0

inoremap <expr> <Esc> pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"
imap <expr> <CR>  pumvisible() ? "\<C-y>" : "<Plug>delimitMateCR"
function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> gi :call LanguageClient#textDocument_hover()<cr>
    vnoremap <buffer> <silent> <leader>i :call LanguageClient_textDocument_rangeFormatting()<cr>
    nnoremap <buffer> <silent> <leader>gm :Denite contextMenu<cr>
    nnoremap <buffer> <silent> <leader>m :Denite documentSymbol<cr>
    nnoremap <buffer> <silent> <leader>gr :Denite references<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <leader>R :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction
autocmd FileType * call LC_maps()

function Swift_setup()
  call deoplete#custom#option('auto_complete_delay', 10)
endfunction
autocmd FileType swift call Swift_setup()
