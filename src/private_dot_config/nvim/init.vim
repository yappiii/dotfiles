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
lua require('colorschema')
lua require('core')
lua require('plugins')

" copilotをluaに移行してからこちらも移行する
let g:copilot#enable = 1
let g:copilot#enable_at_startup = 1
let g:copilot#no_tab_maps = 1

"" # coc-nvim
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
let g:coc_node_path = "~/.anyenv/envs/nodenv/shims/node"
let g:coc_ruby_path = "~/.anyenv/envs/rbenv/shims/ruby"
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
