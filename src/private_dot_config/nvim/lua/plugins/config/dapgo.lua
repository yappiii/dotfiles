vim.api.nvim_set_keymap("n", "<leader>td", ":lua require'dap-go'.debug_test()<CR>", { silent = true })
