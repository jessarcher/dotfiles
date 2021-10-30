Plug 'vim-test/vim-test'

let test#php#phpunit#executable = 'deliver vendor/bin/phpunit'

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

augroup AutoDeleteTestTermBuffers
    autocmd!
    autocmd BufLeave term://*artisan\stest* bdelete!
    autocmd BufLeave term://*phpunit* bdelete!
augroup END
