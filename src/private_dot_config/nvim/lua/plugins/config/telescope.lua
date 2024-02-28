vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
