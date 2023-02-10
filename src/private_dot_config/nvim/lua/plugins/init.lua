vim.cmd.packadd "packer.nvim"

require("packer").startup(function(use)
  use {"akinsho/toggleterm.nvim", tag = '*', config = require"toggleterm".setup{
    size = 20,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal',
  }}
end)

function _G.set_terminal_keymaps()
  local ops = { buffer = 0 }
  vim.api.nvim_buf_set_keymap('t', '<esc>', [[<C-\><C-n>]], ops)
  vim.api.nvim_buf_set_keymap('t', 'jk', [[<C-\><C-n>]], ops)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
