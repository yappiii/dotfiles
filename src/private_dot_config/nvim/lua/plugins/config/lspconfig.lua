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

require("lspconfig").gopls.setup({
  cmd = {
    "gopls",
    "serve"
  },
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true
      },
      staticcheck = true
    }
  }
})
