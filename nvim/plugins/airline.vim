Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme = 'dracula'

let g:airline_symbols = {'space': ' ', 'paste': 'PASTE', 'maxlinenr': ' c', 'dirty': '!', 'crypt': '🔒', 'linenr': 'l:', 'readonly': '⊝', 'spell': 'SPELL', 'modified': '+', 'notexists': 'Ɇ', 'keymap': 'Keymap:', 'ellipsis': '...', 'branch': 'ᚠ', 'whitespace': '☲'}

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

set noshowmode
