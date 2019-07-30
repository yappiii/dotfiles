set autoindent
set clipboard=unnamed
set hls
set number
set shiftwidth=4
set splitright
set tabstop=4

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
filetype plugin indent on
syntax enable
