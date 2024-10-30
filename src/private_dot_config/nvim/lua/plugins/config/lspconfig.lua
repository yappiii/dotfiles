local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'
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

-- gopls
lspconfig.gopls.setup({
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

lspconfig.tsserver.setup({
  on_attach = on_attach
})

lspconfig.vimls.setup({
  on_attach = on_attach
})

lspconfig.rubocop.setup({
  on_attach = on_attach,
})

if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "-v", "./..." };
			}
		};
	}
end
lspconfig.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}

-- terraform
lspconfig.terraformls.setup{}

-- ruby
lspconfig.solargraph.setup({
  on_attach = on_attach
})
