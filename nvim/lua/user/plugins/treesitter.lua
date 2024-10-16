-- Syntax highlighting

return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  dependencies = {
    { 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        languages = {
          php_only = '// %s',
          php = '// %s',
          -- blade = '{{-- %s --}}',
          -- blade = {
          --   __default = '{{-- %s --}}',
          --   html = '{{-- %s --}}',
          --   blade = '{{-- %s --}}',
          --   php = '// %s',
          --   php_only = '// %s',
          -- }
        },
        custom_calculation = function (node, language_tree)
          -- print(language_tree:lang())
          -- print(node:type())
          print(vim.bo.filetype)
          print(language_tree._lang)
          print('----')
          if vim.bo.filetype == 'blade' then
            if language_tree._lang == 'html' then
              return '{{-- %s --}}'
            else
              return '// %s'
            end
          end
          -- if vim.bo.filetype == 'blade' and language_tree._lang ~= 'javascript' and language_tree._lang ~= 'php' then
          --   return '{{-- %s --}}'
          -- end
        end,
      },
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
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
      'http',
      'ini',
      'javascript',
      'json',
      'jsonc',
      'lua',
      'make',
      'markdown',
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
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" }
    },
    rainbow = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['if'] = '@function.inner',
          ['af'] = '@function.outer',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
  },
  config = function (_, opts)
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main",
      },
      filetype = "blade"
    }

    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    })

    require('nvim-treesitter.configs').setup(opts)
  end,
}
