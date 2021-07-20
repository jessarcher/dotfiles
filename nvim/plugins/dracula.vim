Plug 'dracula/vim', { 'as': 'dracula' }

augroup DraculaOverrides
    autocmd!
    autocmd Colorscheme * highlight DraculaBoundary guibg=none
    autocmd Colorscheme * highlight DraculaDiffDelete ctermbg=none guibg=none
augroup end
