vim.cmd([[
  augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>pm :PhpactorContextMenu<CR>
    au FileType php nmap <buffer> <Leader>pn :PhpactorClassNew<CR>
  augroup END
]])
