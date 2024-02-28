require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    telescope = true,
    harpoon = true,
    mason = true,
    neotest = true,
  }
})
vim.cmd("colorscheme catppuccin-mocha")
