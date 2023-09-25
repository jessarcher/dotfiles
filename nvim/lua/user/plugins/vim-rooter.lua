return {
  'airblade/vim-rooter',
  init = function()
    -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
    vim.g.rooter_manual_only = 1
    vim.g.rooter_patterns = {'.git', 'composer.json'}
  end,
  config = function()
    vim.cmd('Rooter')
  end,
}
