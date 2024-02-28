if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
	call dein#end()
	call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
	call dein#install()
endif

lua require('anyenv')
lua require('core')
lua require('plugins')

" copilotをluaに移行してからこちらも移行する
let g:copilot#enable = 1
let g:copilot#enable_at_startup = 1
let g:copilot#no_tab_maps = 1

""" bufferを指定して移動
nnoremap <silent> <space>bn :<C-u>bnext<CR>
nnoremap <silent> <space>bp :<C-u>bprev<CR>

filetype plugin indent on
syntax enable

"" ale
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fixers = {
  \ 'ruby': ['rubocop']
  \ }
