-- node
vim.g.node_host_prog = "~/.anyenv/envs/nodenv/versions/18.0.0/bin/neovim-node-host"

vim.cmd [[
au BufNewFile,BufRead *.tsx setf typescript.tsx
au BufNewFile,BufRead let b:coc_root_patterns = ['.env']
]]

-- python
vim.g.python3_dir = '~/.anyenv/envs/pyenv/shims/'
vim.g.python3_host_prog = '~/.anyenv/envs/pyenv/shims/python'

-- ruby
vim.g.ruby_host_prog = '~/.anyenv/envs/rbenv/shims/neovim-ruby-host'
