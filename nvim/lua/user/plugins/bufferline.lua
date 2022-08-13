require('bufferline').setup({
  options = {
    indicator_icon = ' ',
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
    },
    separator_style = 'slant',
    modified_icon = '',
    custom_areas = {
      left = function()
        return {
          { text = '    ', guifg = '#8fff6d' },
        }
      end,
    },
  },
  highlights = {
    fill = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    background = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    tab = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    buffer_visible = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    close_button = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
      guifg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    close_button_selected = {
      guifg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    close_button_visible = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
      guifg = { attribute = 'fg', highlight = 'StatusLineNonText' },
    },
    tab_close = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    modified = {
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    separator = {
      guifg = { attribute = 'bg', highlight = 'StatusLine' },
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
    separator_selected = {
      guifg = { attribute = 'bg', highlight = 'StatusLine' },
      guibg = { attribute = 'bg', highlight = 'Normal' }
    },
    separator_visible = {
      guifg = { attribute = 'bg', highlight = 'StatusLine' },
      guibg = { attribute = 'bg', highlight = 'StatusLine' },
    },
  },
})
