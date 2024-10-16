-- Add smooth scrolling to avoid jarring jumps

return {
  'karb94/neoscroll.nvim',
  config = function ()
    local neoscroll = require('neoscroll')
    neoscroll.setup({
      -- easing = 'sine',
    })
    local keymap = {
      ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 100 }) end;
      ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 100 }) end;
      ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 250 }) end;
      ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 250 }) end;
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end
}
