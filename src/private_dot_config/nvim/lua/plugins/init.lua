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
  use({ "akinsho/toggleterm.nvim", config = function()
    require("plugins.config.toggleterm")
  end })
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
  use({ "nvim-tree/nvim-web-devicons" })
  use({ "rebelot/kanagawa.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "romgrk/barbar.nvim", requires = "nvim-web-devicons"})
  use({ "airblade/vim-gitgutter" })
  use({ "editorconfig/editorconfig-vim" })
  use({ "junegunn/fzf", run = "./install --all" })
  use({ "tpope/vim-fugitive" })
  use({ "segeljakt/vim-silicon" })
  use({ "ryanoasis/vim-devicons" })
  use({ "github/copilot.vim", run = "cargo build --release" })
  use({ "wbthomason/packer.nvim" })

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

require("plugins/toggleterm")
