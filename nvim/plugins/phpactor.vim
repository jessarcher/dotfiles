Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
augroup END
