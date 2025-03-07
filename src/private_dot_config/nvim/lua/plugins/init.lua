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
  -- use({ "rebelot/kanagawa.nvim" })
  use({ "L3MON4D3/LuaSnip" })
  use({ "airblade/vim-gitgutter" })
  use({ "akinsho/toggleterm.nvim", config = function() require("plugins.config.toggleterm") end })
  use({ "catppuccin/nvim", as = "catppuccin", config = function() require("plugins.config.catppuccin") end })
  use({ "editorconfig/editorconfig-vim" })
  use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
  use({ "github/copilot.vim", run = "cargo build --release" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/nvim-cmp", config = function() require("plugins.config.nvimcmp") end })
  use({ "junegunn/fzf", run = "./install --all" })
  use({ "leoluz/nvim-dap-go", config = function() require("plugins.config.dapgo") end })
  use({ "mfussenegger/nvim-dap", config = function() require("plugins.config.dap") end })
  use({ "neovim/nvim-lspconfig", config = function() require("plugins.config.lspconfig") end })
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
  use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" }, config = function() require("plugins.config.telescope") end})
  use({ "nvim-tree/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", config = function() require("plugins.config.nvimtree") end })
  use({ "nvim-tree/nvim-web-devicons" })
  use({ "rcarriga/nvim-dap-ui", config = function() require("plugins.config.dapui") end })
  use({ "nvim-neotest/nvim-nio"})
  use({ "romgrk/barbar.nvim", requires = "nvim-web-devicons"})
  use({ "ryanoasis/vim-devicons" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "sindrets/diffview.nvim", config = function() require("plugins.config.diffview") end })
  use({ "segeljakt/vim-silicon" })
  use({ "kylechui/nvim-surround", config = function() require("plugins.config.surround") end })
  use({ "tpope/vim-fugitive" })
  use({ "wbthomason/packer.nvim" })

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
