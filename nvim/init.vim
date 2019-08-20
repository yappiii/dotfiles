set autoindent
set clipboard=unnamed
set hls
set number
set shiftwidth=4
set splitright
set tabstop=4

" emacs keybind
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill()<CR>

function! s:home()
	let start_column = col('.')
	normal! ^
	if col('.') == start_column
	¦ normal! 0
	endif
	return ''
endfunction

function! s:kill()
	let [text_before, text_after] = s:split_line()
	if len(text_after) == 0
	¦ normal! J
	else
	¦ call setline(line('.'), text_before)
	endif
	return ''
endfunction

function! s:split_line()
  let line_text = getline(line('.'))
  let text_after  = line_text[col('.')-1 :]
  let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before, text_after]
endfunction

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

filetype plugin indent on
syntax enable
