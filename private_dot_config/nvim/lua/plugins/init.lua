vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
end)

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
