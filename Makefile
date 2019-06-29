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
	npm install --global pure-prompt
.PHONY: init

nvim:
	$(call link,nvim,~/.config/nvim)
.PHONY: nvim
