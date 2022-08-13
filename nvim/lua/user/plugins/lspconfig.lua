local buf_option = vim.api.nvim_buf_set_option
local buf_keymap = require('user.lib.utils').buf_keymap
local keymap = require('user.lib.utils').keymap
local util = require('lspconfig.util')

vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting_seq_sync, {})

keymap('n', '<leader>ca', ':CodeActionMenu<CR>')
keymap('v', '<leader>ca', ':CodeActionMenu<CR>')

keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- vim.lsp.set_log_level("debug")

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    source = true,
    focus = false,
    format = function(diagnostic)
      if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
        return string.format('%s: %s', diagnostic.user_data.lsp.code, diagnostic.message)
      end
      return diagnostic.message
    end,
  },
})

local on_attach = function(_, bufnr)
  buf_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- buf_keymap(bufnr, 'n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  buf_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  buf_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- buf_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  buf_keymap(bufnr, 'n', 'gr', ':Telescope lsp_references<CR>')

  -- buf_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- buf_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
  -- buf_keymap(bufnr, 'n', '<leader>ca', ':Telescope lsp_code_actions<CR>')
  -- buf_keymap(bufnr, 'v', '<leader>ca', ':Telescope lsp_range_code_actions<CR>')
  -- buf_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  -- buf_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function get_typescript_server_path(root_dir)
  local project_root = util.find_node_modules_ancestor(root_dir)

  local local_tsserverlib = project_root ~= nil and util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js')
  local global_tsserverlib = '/home/jess/.local/lib/node_modules/typescript/lib/tsserverlibrary.js'

  if local_tsserverlib and util.path.exists(local_tsserverlib) then
    return local_tsserverlib
  else
    return global_tsserverlib
  end
end

require('lspconfig').bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').intelephense.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
})

-- require'lspconfig'.phpactor.setup{
--   cmd = { '/home/jess/.local/share/nvim/site/pack/packer/opt/phpactor/bin/phpactor', 'language-server' },
--   on_attach = on_attach,
--   capabilities = capabilities,
--   init_options = {
--     ["language_server_phpstan.enabled"] = false,
--     ["language_server_psalm.enabled"] = false,
--   }
-- }

require('lspconfig').jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

require('lspconfig').solang.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'solang', '--language-server', '--target', 'ewasm', '--importpath', 'node_modules' },
})

require('lspconfig').sqls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')
require('lspconfig').sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = { '/opt/lua-language-server/bin/lua-language-server', '-E', '/opt/lua-language-server/bin/main.lua' },
  cmd = { '/opt/lua-language-server/bin/lua-language-server' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        -- path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        -- ['undefined-global'] = false,
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = { enable = false },
    },
  },
})

require('lspconfig').tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require('lspconfig').volar.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
  end,
  capabilities = capabilities,
  -- Enable "Take Over Mode" where volar will provide all TS LSP services
  -- This drastically improves the responsiveness of diagnostic updates on change
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

-- suppress error messages from lang servers
-- vim.notify = function(msg, log_level, _)
--   if msg:match 'exit code' then
--     return
--   end
--   if log_level == vim.log.levels.ERROR then
--     vim.api.nvim_err_writeln(msg)
--   else
--     vim.api.nvim_echo({ { msg } }, true, {})
--   end
-- end
