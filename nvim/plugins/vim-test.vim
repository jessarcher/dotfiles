Plug 'vim-test/vim-test'

function! InteractiveZshTransform(cmd) abort
    return 'zsh -ic "'.a:cmd.'"'
endfunction

let g:test#custom_transformations = {
    \ 'zsh': function('InteractiveZshTransform')
\ }

let test#strategy = "neovim"
let g:test#transformation = 'zsh'
let test#php#phpunit#executable = 'phpunit'

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
