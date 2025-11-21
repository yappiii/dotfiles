local on_attach = function(client, bufnr)
  vim.api.nvim_set_keymap("n", "gd", vim.lsp.buf.definition, {
    noremap = true,
    silent = true
  })
  vim.api.nvim_set_keymap("n", "gD", vim.lsp.buf.declaration, {
    noremap = true,
    silent = true
  })
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
        vim.lsp.buf.format { async = false }
    end
  })
end

vim.lsp.config('*', {
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})
vim.lsp.config('gopls', {
  cmd = {
    "gopls",
    "serve"
  }
})
vim.lsp.config('golangci_lint_ls', {
  filetypes = {'go', 'gomod'}
})

-- gopls
vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("vimls")
vim.lsp.enable("rubocop")
vim.lsp.enable("golangci_lint_ls")
vim.lsp.enable("terraformls")
vim.lsp.enable("solargraph")
