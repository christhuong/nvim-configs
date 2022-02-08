local M = {}

function M.config()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  null_ls.setup {
    sources = {
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.formatting.prettier
    },
    on_attach = require('plugins.lsp').on_attach,
  }
end

return M
