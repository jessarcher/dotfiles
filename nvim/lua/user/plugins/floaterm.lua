local keymap = require 'lib.utils'.keymap

keymap('n', '<F1>', ':FloatermToggle scratch<CR>')
keymap('t', '<F1>', '<C-\\><C-n>:FloatermToggle scratch<CR>')

vim.g.floaterm_gitcommit='floaterm'
vim.g.floaterm_autoinsert=1
vim.g.floaterm_width=0.8
vim.g.floaterm_height=0.8
vim.g.floaterm_wintitle=0

vim.cmd([[
    " DraculaBgLight
    hi Floaterm guibg=#343746
    hi FloatermBorder guifg=#343746 guibg=#343746
]])
