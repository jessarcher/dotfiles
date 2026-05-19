-- Show pending keybinds

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    wk.setup({
      delay = 400,
    })

    wk.add({
      { '<leader>t', group = 'Test' },
      { '<leader>p', group = 'Phpactor' },
      { '<leader>l', group = 'LSP' },
      { '<leader>r', group = 'Rename' },
    })
  end,
}
