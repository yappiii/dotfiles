-- TBD
require('claude-code').setup({})

vim.api.nvim_set_keymap("n", "<leader>cc", ":ClaudeCode<CR>", { noremap = true, silent = true })
