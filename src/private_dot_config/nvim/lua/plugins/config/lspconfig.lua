local on_attach = function(client, bufnr)
  print("LSP attached: " .. client.name)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
    noremap = true,
    silent = true
  })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
    noremap = true,
    silent = true
  })
  local group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format { async = false }
    end,
  })
end

vim.lsp.config('*', {
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

vim.lsp.config('gopls', {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_markers = { "go.mod", "go.work", ".git" },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = false,
      directoryFilters = { "-vendor", "-node_modules", "-.git", "-tmp" },
    }
  }
})

-- gopls
vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("vimls")
vim.lsp.enable("rubocop")
vim.lsp.enable("terraformls")
vim.lsp.enable("solargraph")
