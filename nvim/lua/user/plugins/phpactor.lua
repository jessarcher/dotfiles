vim.cmd([[
  augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
  augroup END
]])
