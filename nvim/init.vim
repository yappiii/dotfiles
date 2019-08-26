" init
set autoindent
set clipboard=unnamed
set hls
set number
set shiftwidth=4
set splitright
set tabstop=5

" emacs keybind
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>

" dein settings
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

" plugin dependencies

"" # ayu
set termguicolors
let ayucolor="mirage"
colorscheme ayu

"" # airline
let g:airline_theme='ayu_mirage'

"" # deoplete
let g:deoplete#enable_at_startup = 1

"" # phpactor
autocmd FileType php setlocal omnifunc=phpactor#Complete
nmap <silent><C-j> :<C-u>call phpactor#GotoDefinition()<CR>
vmap <silent><C-h> :<C-u>call phpactor#Hover()<CR>

filetype plugin indent on
syntax enable
