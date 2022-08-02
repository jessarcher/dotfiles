local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.signcolumn = 'yes:2'
opt.relativenumber = true
opt.number = true
opt.breakindent = true
opt.termguicolors = true
opt.undofile = true
opt.spell = true
opt.title = true
opt.ignorecase = true
opt.smartcase = true
opt.wildmode = 'longest:full,full'
opt.wrap = false
opt.list = true
opt.listchars = 'tab:▸ ,trail:·'
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = 'unnamedplus' -- Use Linux system clipboard
opt.confirm = true
opt.backup = true
opt.backupdir = vim.fn.stdpath('data') .. '/backup//'
opt.updatetime = 4001 -- Set updatime to 1ms longer than the default to prevent polyglot from changing it
opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
opt.showmode = false
opt.fillchars = 'eob: '
opt.shortmess:append({ I = true })

local highlight_group = vim.api.nvim_create_augroup('Blah', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.cmd('hi SpellBad gui=undercurl guifg=none')

    local bg = vim.api.nvim_get_hl_by_name('PMenu', true).background
    vim.api.nvim_set_hl(0, 'PMenuBg', { fg = bg, bg = bg })

    bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background
    vim.api.nvim_set_hl(0, 'CursorLineBg', { fg = bg, bg = bg })
  end,
  group = highlight_group,
  pattern = '*',
})

vim.cmd([[colorscheme onedark]])
