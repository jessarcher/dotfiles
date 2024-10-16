vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])

vim.api.nvim_create_autocmd('textyankpost', {
  desc = 'highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})
