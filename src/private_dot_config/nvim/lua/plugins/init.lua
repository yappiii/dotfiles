local fn = vim.fn

local install_path = fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
})

packer.startup(function(use)
  use({ "akinsho/toggleterm.nvim", config = require("plugins.config.toggleterm") })
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
  use({ "nvim-tree/nvim-web-devicons" })
  use({ "rebelot/kanagawa.nvim" })
  use({ "romgrk/barbar.nvim", requires = "nvim-web-devicons"})
  use({ "wbthomason/packer.nvim" })

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

require("plugins/toggleterm")
