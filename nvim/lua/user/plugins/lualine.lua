local separator = { '"▏"', color = 'StatusLineNonText' }

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'arkav/lualine-lsp-progress',
    'kyazdani42/nvim-web-devicons',
  },
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
      globalstatus = true,
      theme = {
        normal = {
          a = 'StatusLine',
          b = 'StatusLine',
          c = 'StatusLine',
        },
      },
    },
    sections = {
      lualine_a = {
        'mode',
        separator,
      },
      lualine_b = {
        'branch',
        'diff',
        separator,
        function ()
          return '🖧  ' .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or '')
        end,
        { 'diagnostics', sources = { 'nvim_diagnostic' } },
        separator,
      },
      lualine_c = {
        'filename'
      },
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
        {
          separator[1],
          color = separator['color'],
          cond = require("lazy.status").has_updates,
        },
      },
      lualine_y = {
        'filetype',
        'encoding',
        'fileformat',
        '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
        separator,
      },
      lualine_z = {
        'location',
        'progress',
      },
    },
  },
}
