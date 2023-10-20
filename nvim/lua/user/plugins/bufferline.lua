local inactiveBg = {
  bg = { attribute = 'bg', highlight = 'BufferlineInactive' },
}

return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      indicator = {
        icon = ' ',
      },
      show_close_icon = false,
      tab_size = 0,
      max_name_length = 25,
      offsets = {
        {
          filetype = 'NvimTree',
          text = '  Files',
          highlight = 'StatusLine',
          text_align = 'left',
        },
        {
          filetype = 'neo-tree',
          text = function()
            return ' '..vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
          end,
          highlight = 'StatusLineComment',
          text_align = 'left',
        },
      },
      hover = {
        enabled = true,
        delay = 0,
        reveal = { "close" },
      },
      separator_style = 'slant',
      modified_icon = '',
      custom_areas = {
        left = function()
          return {
            { text = ' ' },
          }
        end,
        right = function()
          return {
            { text = '    ', fg = '#8fff6d' },
          }
        end,
      },
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return icon .. count
      end,
    },
    highlights = {
      fill = {
        bg = { attribute = 'bg', highlight = 'StatusLine' },
      },
      background = inactiveBg,
      close_button = inactiveBg,
      diagnostic = inactiveBg,
      diagnostic_visible = inactiveBg,
      modified = inactiveBg,
      modified_visible = inactiveBg,
      hint = inactiveBg,
      hint_visible = inactiveBg,
      info = inactiveBg,
      info_visible = inactiveBg,
      warning = inactiveBg,
      warning_visible = inactiveBg,
      error = inactiveBg,
      error_visible = inactiveBg,
      hint_diagnostic = inactiveBg,
      hint_diagnostic_visible = inactiveBg,
      info_diagnostic = inactiveBg,
      info_diagnostic_visible = inactiveBg,
      warning_diagnostic = inactiveBg,
      warning_diagnostic_visible = inactiveBg,
      error_diagnostic = inactiveBg,
      error_diagnostic_visible = inactiveBg,
      duplicate = inactiveBg,
      duplicate_visible = inactiveBg,
      separator = {
        fg = { attribute = 'bg', highlight = 'StatusLine' },
        bg = { attribute = 'bg', highlight = 'BufferlineInactive' },
      },
      separator_selected = {
        fg = { attribute = 'bg', highlight = 'StatusLine' },
      },
      separator_visible = {
        fg = { attribute = 'bg', highlight = 'StatusLine' },
      },
      trunc_marker = {
        bg = { attribute = 'bg', highlight = 'StatusLine' },
      },

      -- Tabs
      tab = inactiveBg,
      tab_separator = {
        fg = { attribute = 'bg', highlight = 'StatusLine' },
        bg = { attribute = 'bg', highlight = 'BufferlineInactive' },
      },
      tab_separator_selected = {
        fg = { attribute = 'bg', highlight = 'StatusLine' },
      },
      tab_close = {
        bg = 'yellow',
      },
    },
  }
}
