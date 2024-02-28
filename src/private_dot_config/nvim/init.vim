lua require('anyenv')
lua require('core')
lua require('plugins')

filetype plugin indent on
syntax enable

"" ale
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fixers = {
  \ 'ruby': ['rubocop']
  \ }
