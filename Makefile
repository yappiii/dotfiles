MKDIR     = mkdir $(MKDIR_OPT)
MKDIR_OPT = -p
LN        = ln $(LN_OPT)
LN_OPT    = -sfn
RM        = rm $(RM_OPT)
RM_OPT    = -rf

define link
	$(MKDIR) $(dir $2)
	$(LN) $(realpath $1) $2
endef

zplug: zsh
	git clone \
		https://github.com/zplug/zplug \
		~/.zsh/zplug
.PHONY: zplug

local:
	$(MKDIR) ~/.local
	touch ~/.local/vimrc
	touch ~/.local/zshrc
.PHONY: local

init:
	npm i pure-prompt -g
	npm i intelephense -g
.PHONY: init

nvim:
	$(call link,nvim,~/.config/nvim)
	$(call link,nvim/init.vim,~/.config/nvim/init.vim)
.PHONY: nvim

zsh:
	$(call link,zsh/.zshenv,~/.zshenv)
	$(call link,zsh/.zshrc,~/.zshrc)
	export ZDOTDIR=$HOME/.zshrc
.PHONY: zsh

tmux:
	$(call link,tmux/.tmux.conf,~/.tmux.conf)
.PHONY: tmux

dein: nvim
	git clone \
		https://github.com/Shougo/dein.vim \
		~/.vim/plugins/repos/github.com/Shougo/dein.vim
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/.cache/dein
	pip3 install --user pynvim
	rm installer.sh
.PHONY: dein

hammerspoon:
	$(MKDIR) ~/.hammerspoon
	git clone https://github.com/agzam/spacehammer ~/.hammerspoon
.PHONY: hammerspoon
