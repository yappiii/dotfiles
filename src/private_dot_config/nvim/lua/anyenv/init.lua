vim.cmd [[
au BufNewFile,BufRead *.tsx setf typescript.tsx
au BufNewFile,BufRead let b:coc_root_patterns = ['.env']
]]

-- python
vim.g.python3_dir = '~/.anyenv/envs/pyenv/shims/'
vim.g.python3_host_prog = '~/.anyenv/envs/pyenv/shims/python'

-- ruby
vim.g.ruby_host_prog = '~/.anyenv/envs/rbenv/shims/neovim-ruby-host'
