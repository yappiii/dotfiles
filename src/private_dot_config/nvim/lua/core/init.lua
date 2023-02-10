local options = {
  autoindent = true,
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  diffopt = "filler,iwhite,internal,algorithm:patience",
  encoding = "utf-8",
  expandtab = true,
  fenc = "utf-8",
  fileencodings = "utf-8,iso-2022-jp,euc-jp,sjis",
  hidden = true,
  hlsearch = true,
  ignorecase = true,
  inccommand = "split",
  incsearch = true,
  list = true,
  listchars = "tab:»·,trail:·,nbsp:·",
  number = true,
  shiftwidth = 2,
  shortmess = "aoOTIcF",
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  splitright = true,
  tabstop = 2,
  termguicolors = true,
  updatetime = 300,
  whichwrap = "b,s,<,>,[,],h,l",
  wrapscan = true,
  writebackup = false,
}
local keymap = vim.api.nvim_set_keymap

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- keymaps
keymap("n", ";", ":", { noremap = true })
---- emacs keybind
keymap("n", "C-p", "<Up>", { noremap = true })
keymap("n", "C-n", "<Down>", { noremap = true })
keymap("n", "C-f", "<Right>", { noremap = true })
keymap("n", "C-b", "<Left>", { noremap = true })
keymap("n", "C-e", "<End>", { noremap = true })
