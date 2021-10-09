Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://github\.com'] = { 'takeover': 'always', 'priority': 1 }

augroup FirenvimOverrides
    autocmd!
    autocmd BufEnter github.com_*.txt set filetype=markdown
augroup END
