-- Syntax highlighting

return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  dependencies = {
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
    local query = vim.treesitter.query
    local html_script_type_languages = {
      ['importmap'] = 'json',
      ['module'] = 'javascript',
      ['application/ecmascript'] = 'javascript',
      ['text/ecmascript'] = 'javascript',
    }
    local non_filetype_match_injection_language_aliases = {
      ex = 'elixir',
      pl = 'perl',
      sh = 'bash',
      uxn = 'uxntal',
      ts = 'typescript',
    }

    local function get_capture_node(match, capture_id)
      local value = match[capture_id]
      if type(value) == 'table' then
        return value[1]
      end
      return value
    end

    local function get_capture_metadata(metadata, capture_id)
      local value = metadata[capture_id]
      if type(value) == 'table' and value[1] ~= nil then
        return value[1]
      end
      return value
    end

    local function get_parser_from_markdown_info_string(injection_alias)
      local match = vim.filetype.match({ filename = 'a.' .. injection_alias })
      return match or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
    end

    query.add_directive('set-lang-from-mimetype!', function(match, _, bufnr, pred, metadata)
      local capture_id = pred[2]
      local node = get_capture_node(match, capture_id)
      if not node then
        return
      end

      local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
      local configured = html_script_type_languages[type_attr_value]
      if configured then
        metadata['injection.language'] = configured
      else
        local parts = vim.split(type_attr_value, '/', {})
        metadata['injection.language'] = parts[#parts]
      end
    end, { force = true, all = true })

    query.add_directive('set-lang-from-info-string!', function(match, _, bufnr, pred, metadata)
      local capture_id = pred[2]
      local node = get_capture_node(match, capture_id)
      if not node then
        return
      end

      local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
      metadata['injection.language'] = get_parser_from_markdown_info_string(injection_alias)
    end, { force = true, all = true })

    query.add_directive('downcase!', function(match, _, bufnr, pred, metadata)
      local capture_id = pred[2]
      local node = get_capture_node(match, capture_id)
      if not node then
        return
      end

      local capture_metadata = get_capture_metadata(metadata, capture_id)
      local text = vim.treesitter.get_node_text(node, bufnr, { metadata = capture_metadata }) or ''

      if type(metadata[capture_id]) == 'table' and metadata[capture_id][1] ~= nil then
        metadata[capture_id][1] = metadata[capture_id][1] or {}
        metadata[capture_id][1].text = string.lower(text)
      else
        metadata[capture_id] = metadata[capture_id] or {}
        metadata[capture_id].text = string.lower(text)
      end
    end, { force = true, all = true })

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
