require("conform").setup({
  formatters_by_ft = {
    go = { "goimports", "gofmt" },
    python = { "autopep8" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
  -- 保存時のオートフォーマット設定
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
