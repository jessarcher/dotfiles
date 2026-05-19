return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      php = { "pint" },
      javascript = { "oxfmt", "prettierd", stop_after_first = true },
      javascriptreact = { "oxfmt", "prettierd", stop_after_first = true },
      typescript = { "oxfmt", "prettierd", stop_after_first = true },
      typescriptreact = { "oxfmt", "prettierd", stop_after_first = true },
      vue = { "prettierd", stop_after_first = true },
    },
    formatters = {
      oxfmt = {
        require_cwd = true,
      },
      prettierd = {
        require_cwd = true,
      },
      prettier = {
        require_cwd = true,
      },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return {
        -- These options will be passed to conform.format()
        timeout_ms = 1000,
        -- lsp_format = "fallback"
      }
    end,
  },
  init = function()
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}
