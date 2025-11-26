vim.lsp.config('*', {
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

local group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- デバッグ用
    print(("LSP attached: %s (bufnr=%d)"):format(client.name, bufnr))

    -- buffer ローカルマップ用ヘルパー
    local function bufmap(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, {
        noremap = true,
        silent = true,
        buffer = bufnr,
      })
    end

    -- 定義ジャンプ
    bufmap("n", "gd", vim.lsp.buf.definition)
    bufmap("n", "gD", vim.lsp.buf.declaration)

    -- 保存時フォーマット
    local fmt_group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = fmt_group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end,
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

vim.lsp.config('basedpyright', {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    '.git',
  }
})

vim.lsp.enable('gopls')
vim.lsp.enable('basedpyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('vimls')
vim.lsp.enable('rubocop')
vim.lsp.enable('terraformls')
vim.lsp.enable('solargraph')
