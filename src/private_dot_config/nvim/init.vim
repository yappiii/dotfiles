" init
set autoindent
set clipboard=unnamed
set cmdheight=2
set fenc=utf-8
set diffopt=internal,filler,algorithm:histogram,indent-heuristic
set encoding=utf-8
set expandtab
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set hidden
set hls
set ignorecase
set inccommand=split
set list
set listchars=tab:\▸\ ,eol:↲
set nobackup
set nowritebackup
set number
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set smartcase
set splitright
set tabstop=2
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

" lua plugins
lua require('plugins')

" node settings
let g:node_host_prog = "/Users/takatsugu.yoneya/.anyenv/envs/nodenv/versions/18.0.0/bin/neovim-node-host"
"" tsxを開いた時のsyntax ruleを上書く
au BufNewFile,BufRead *.tsx setf typescript.tsx
"" 暫定対応
au BufNewFile,BufRead let b:coc_root_patterns = ['.env']

" python settings
let g:python3_dir = '~/.anyenv/envs/pyenv/shims/'
let g:python3_host_prog= g:python3_dir . 'python'
let g:ruby_host_prog = '/Users/takatsugu.yoneya/.anyenv/envs/rbenv/shims/neovim-ruby-host'

" copilot settings
let g:copilot#enable = 1
let g:copilot#enable_on_startup = 1

"" ruby settings

" plugin dependencies

"" # ayu
""" 背景透過用の設定
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set termguicolors
let ayucolor="dark"
colorscheme ayu

"" # coc-nvim
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
let g:coc_node_path = "/Users/takatsugu.yoneya/.anyenv/envs/nodenv/shims/node"
let g:coc_ruby_path = "/Users/takatsugu.yoneya/.anyenv/envs/rbenv/shims/ruby"
let g:coc_global_extensions = [
\   'coc-css'
\   , 'coc-eslint'
\   , 'coc-explorer'
\   , 'coc-go'
\   , 'coc-git'
\   , 'coc-graphql'
\   , 'coc-highlight'
\   , 'coc-json'
\   , 'coc-lists'
\   , 'coc-prettier'
\   , 'coc-snippets'
\   , 'coc-solargraph'
\   , 'coc-tabnine'
\   , 'coc-tsserver'
\   , 'coc-vimlsp'
\   , 'coc-yaml'
\   ]

""" coc-list
nmap <silent> <space><space> :<C-u>CocList<CR>
""" Hover
nmap <silent> <space>h :<C-u>call CocActionAsync('doHover')<CR>
""" Difinition
function! ChooseAction(actions) abort
  echo join(map(copy(a:actions), { _, v -> v.text }), ", ") .. ": "
  let result = getcharstr()
  let result = filter(a:actions, { _, v -> v.text =~# printf(".*\(%s\).*", result)})
  return len(result) ? result[0].value : ""
endfunction

function! CocJumpAction() abort
  let actions = [
        \ {"text": "(s)plit", "value": "split"},
        \ {"text": "(v)slit", "value": "vsplit"},
        \ {"text": "(t)ab", "value": "tabedit"},
        \ ]
  return ChooseAction(actions)
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nmap <silent> <space>j :<C-u>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>
""" References
nmap <silent> <space>r :<C-u>call CocActionAsync('doReferences')<CR>
""" Rename
nmap <silent> <space>n :<C-u>call CocActionAsync('rename')<CR>
""" CodeAction
nmap <silent> <space>a :<C-u>call CocActionAsync('doCodeAction')<CR>
""" DocumentSymbol
nmap <silent> <space>o :<C-u>call CocActionAsync('doDocumentSymbol')<CR>
""" WorkspaceSymbol
nmap <silent> <space>i :<C-u>call CocActionAsync('doWorkspaceSymbol')<CR>
""" Format
nmap <silent> <space>f :<C-u>call CocActionAsync('format')<CR>
""" FixCurrent
nmap <silent> <space>q :<C-u>call CocActionAsync('fixCurrent')<CR>
""" RunCommand
nmap <silent> <space>c :<C-u>call CocActionAsync('runCommand')<CR>
""" Fold
nmap <silent> <space>z :<C-u>call CocAction('fold')<CR>
""" FoldAll
nmap <silent> <space>Z :<C-u>call CocAction('fold', 'all')<CR>

""" bufferを指定して移動
nnoremap <silent> <space>bn :<C-u>bnext<CR>
nnoremap <silent> <space>bp :<C-u>bprev<CR>

""" coc-explorer
let g:coc_explorer_global_presets = {
\   'pwd': {
\     'root-uri': getcwd(),
\   },
\ }

""" coc-explorer
nmap <silent> <space>e :<C-u>CocCommand explorer --preset pwd<cr>

filetype plugin indent on
syntax enable

"" rubyのkeybind
runtime! ./keymap/ruby.vim

"" preview-uml.vim
let g:preview_uml_url='http://localhost:8888'

"" preview-markdown.vim
let g:preview_markdown_vertical = 1

"" ale
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fixers = {
  \ 'ruby': ['rubocop']
  \ }

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='simple'
let g:airline#extensions#tabline#formatter = 'default'
