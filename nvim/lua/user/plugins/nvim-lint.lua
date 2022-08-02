require('lint').linters_by_ft = {
  -- php = {'phpcs'}
  -- typescript = {'eslint'},
  -- javascript = {'eslint'},
  -- lua = {'luacheck'},
  -- markdown = {'markdownlint', 'proselint'},
}

-- require('lint').linters.your_linter_name = {
--   cmd = 'php-cs-fixer',
--   stdin = true,
--   args = {
--     'fix',
--     '--dry-run',
--     '--format=json',
--     '-',
--   },
--   ignore_exitcode = true,
--   parser = function(output, _)
--     if vim.trim(output) == '' then
--       return {}
--     end

--     local decoded = vim.json.decode(output)
--     local diagnostics = {}
--     local messages = decoded['files']
--   end
-- }

vim.cmd([[
  augroup NvimLint
    au!
    au BufRead * lua require('lint').try_lint()
    au BufWritePost * lua require('lint').try_lint()
  augroup end
]])
