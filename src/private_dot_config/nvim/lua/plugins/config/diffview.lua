require("diffview").setup()
vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewOpen<CR>', { noremap = true, silent = true })
