" init
set autoindent
set clipboard=unnamed
set cmdheight=2
set diffopt=internal,filler,algorithm:histogram,indent-heuristic
set hls
set ignorecase
set inccommand=split
set list
set listchars=tab:\▸\ ,eol:↲
set nobackup
set noexpandtab
set nowritebackup
set number
set shiftwidth=4
set shortmess+=c
set signcolumn=yes
set smartcase
set splitright
set tabstop=4
set updatetime=250
set whichwrap+=h,l
set wrapscan

" emacs keybind
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>

" other custom keybind
nnoremap ; :

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
""" 背景透過用の設定
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set termguicolors
let ayucolor="mirage"
colorscheme ayu

"" # coc-nvim
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

""" coc-list
nmap <silent> <space><space> :<C-u>CocList<cr>
""" Hover
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
""" Difinition
nmap <silent> <space>j <Plug>(coc-definition)

filetype plugin indent on
syntax enable

"" 背景透過 - colorschemeに依存しているため、ここで実行
hi! Normal ctermbg=NONE guibg=NONE
hi! statusline ctermbg=NONE guibg=NONE
