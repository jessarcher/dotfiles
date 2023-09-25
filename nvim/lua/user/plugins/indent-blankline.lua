return {
  'lukas-reineke/indent-blankline.nvim',
  opts = {
    filetype_exclude = {
      'help',
      'terminal',
      'dashboard',
      'packer',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
    },
    buftype_exclude = {
      'terminal',
      'NvimTree',
    },
  }
}
