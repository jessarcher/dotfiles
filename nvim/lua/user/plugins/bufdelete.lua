-- Close buffers without closing the split window.

return {
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>', { desc = 'Delete buffer' })
    vim.keymap.set('n', '<Leader>Q', ':bufdo Bdelete<CR>', { desc = 'Delete all buffers' })
  end,
}
