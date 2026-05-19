return {
  'neovim-treesitter/nvim-treesitter',
  url = 'https://github.com/neovim-treesitter/nvim-treesitter',
  dependencies = {
    'neovim-treesitter/treesitter-parser-registry',
  },
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')

    -- Languages we want installed/updated locally for highlighting + queries.
    local languages = {
      'arduino',
      'bash',
      'blade',
      'comment',
      'css',
      'diff',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'html',
      'html_tags',
      'http',
      'ini',
      'javascript',
      'json',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'passwd',
      'php',
      'php_only',
      'phpdoc',
      'python',
      'regex',
      'ruby',
      'rust',
      'sql',
      'svelte',
      'typescript',
      'vim',
      'vue',
      'xml',
      'yaml',
    }

    -- Treat Laravel Blade templates as `blade` instead of plain php.
    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    })

    -- Build a quick lookup of already-installed parsers.
    local installed = {}
    for _, lang in ipairs(ts.get_installed()) do
      installed[lang] = true
    end

    -- Install only missing languages to keep startup work minimal.
    local missing = {}
    for _, lang in ipairs(languages) do
      if not installed[lang] then
        table.insert(missing, lang)
      end
    end

    -- Trigger async installs (with summary logs) when something is missing.
    if #missing > 0 then
      ts.install(missing, { summary = true })
    end

    -- Enable Treesitter highlighting per-filetype buffer as files open.
    -- Also opt into Treesitter indentation everywhere except yaml.
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)

        if vim.bo[args.buf].filetype ~= 'yaml' then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
