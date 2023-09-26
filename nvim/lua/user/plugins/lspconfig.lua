return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    { 'jose-elias-alvarez/null-ls.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    -- Setup Mason to automatically install LSP servers
    require('mason').setup({
      ui = {
        height = 0.8,
      },
    })
    require('mason-lspconfig').setup({ automatic_installation = true })

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- PHP
    require('lspconfig').intelephense.setup({
      commands = {
        IntelephenseIndex = {
          function()
            vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
          end,
        },
      },
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
      end,
      capabilities = capabilities
    })

    require('lspconfig').phpactor.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.completionProvider = false
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.implementationProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.renameProvider = false
        client.server_capabilities.selectionRangeProvider = false
        client.server_capabilities.signatureHelpProvider = false
        client.server_capabilities.typeDefinitionProvider = false
        client.server_capabilities.workspaceSymbolProvider = false
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.documentHighlightProvider = false
        client.server_capabilities.documentSymbolProvider = false
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
      },
      handlers = {
        ['textDocument/publishDiagnostics'] = function() end
      }
    })

    -- Vue, JavaScript, TypeScript
    require('lspconfig').volar.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.server_capabilities.inlayHintProvider then
        --   vim.lsp.buf.inlay_hint(bufnr, true)
        -- end
      end,
      capabilities = capabilities,
      -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
      -- This drastically improves the responsiveness of diagnostic updates on change
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })

    -- Tailwind CSS
    require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

    -- JSON
    require('lspconfig').jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    -- null-ls
    local null_ls = require('null-ls')
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      temp_dir = '/tmp',
      sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js' })
          end,
        }),
        -- null_ls.builtins.diagnostics.phpstan, -- TODO: Only if config file
        null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
        null_ls.builtins.formatting.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js', '.eslintrc.json' })
          end,
        }),
        null_ls.builtins.formatting.pint.with({
          condition = function(utils)
            return utils.root_has_file({ 'vendor/bin/pint' })
          end,
        }),
        null_ls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file({ '.prettierrc', '.prettierrc.json', '.prettierrc.yml', '.prettierrc.js', 'prettier.config.js' })
          end,
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
            end,
          })
        end
      end,
    })

    require('mason-null-ls').setup({ automatic_installation = true })

    -- Keymaps
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
    vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { silent = true })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- Commands
    vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      }
    })

    -- Sign configuration
    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
  end,
}
