local M = {}

function M.on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>i', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>p', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  if client.server_capabilities.documentFormattingProvider then
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = false }")
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }")
  end
end

function M.config()
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  require'lspconfig'.solargraph.setup{
    capabilities = capabilities,
    on_attach = M.on_attach,
  }
  require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = M.on_attach,
  }
  require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    -- on_attach = M.on_attach,
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.document_range_formatting = false
      M.on_attach(client, bufnr)
    end
  }
end

return M
