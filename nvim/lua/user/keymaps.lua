-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear search highlighting.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

vim.keymap.set('', '<F1>', '<Nop>', { desc = 'Disable F1 help' })

-- Close all open buffers.
vim.keymap.set('n', '<leader>Q', ':bufdo bdelete<CR>', { desc = 'Delete all buffers' })

-- Diagnostics.
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

-- Allow gf to open non-existent files.
vim.keymap.set('', 'gf', ':edit <cfile><CR>', { desc = 'Edit file under cursor' })

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y', { desc = 'Yank selection and keep cursor' })
vim.keymap.set('v', 'Y', 'myY`y', { desc = 'Yank line and keep cursor' })

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = 'Move up by display line' })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = 'Move down by display line' })

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without replacing register' })

-- Reselect pasted text
-- vim.keymap.set('n', 'p', 'p`[v`]')

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;<Esc>', { desc = 'Append semicolon' })
vim.keymap.set('i', ',,', '<Esc>A,<Esc>', { desc = 'Append comma' })

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set('n', '<leader>x', ':!xdg-open %<cr><cr>', { desc = 'Open current file externally' })

-- Disable annoying command line thing.
vim.keymap.set('n', 'q:', ':q<CR>', { desc = 'Close command-line window' })

-- Resize with arrows.
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Move text up and down
-- vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
-- vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
-- vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
-- vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
-- vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
-- vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")
