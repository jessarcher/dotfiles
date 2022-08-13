vim.cmd([[
  augroup FileTypeOverrides
    autocmd!
    autocmd TermOpen * setlocal nospell
  augroup END
]])

local highlight_group = vim.api.nvim_create_augroup('GeneralColorSchemeTweaks', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.cmd('hi SpellBad gui=undercurl guifg=none')

    local p_menu = vim.api.nvim_get_hl_by_name('PMenu', true)
    vim.api.nvim_set_hl(0, 'PMenuBg', { fg = p_menu.background, bg = p_menu.background })

    local cursor_line = vim.api.nvim_get_hl_by_name('CursorLine', true)
    vim.api.nvim_set_hl(0, 'CursorLineBg', { fg = cursor_line.background, bg = cursor_line.background })

    local status_line = vim.api.nvim_get_hl_by_name('StatusLine', true)
    local non_text = vim.api.nvim_get_hl_by_name('NonText', true)
    vim.api.nvim_set_hl(0, 'StatusLineNonText', { fg = non_text.foreground, bg = status_line.background })
  end,
  group = highlight_group,
  pattern = '*',
})
