Plug 'vim-test/vim-test'

function! InteractiveZshTransform(cmd) abort
    return 'zsh -ic "'.a:cmd.'"'
endfunction

let g:test#custom_transformations = {
    \ 'zsh': function('InteractiveZshTransform')
\ }

let g:test#transformation = 'zsh'
let test#php#phpunit#executable = 'artisan test'

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>
