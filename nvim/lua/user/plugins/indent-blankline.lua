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
      'mason',
    },
    buftype_exclude = {
      'terminal',
      'NvimTree',
    },
  }
}
