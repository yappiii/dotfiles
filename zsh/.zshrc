# dependencies
## phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
## nodebrew
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/dotfiles2/bin/node_modules/.bin
export PATH=$PATH:$HOME/.anyenv/bin
export PATH=$PATH:/opt/homebrew/bin
export STARSHIP_CONFIG=~/.starship/config.toml


# load prompt
# autoload -U promptinit; promptinit
# prompt pure

# completion
autoload -Uz compinit; compinit

# list completion
setopt auto_list

# switch completion sequential
setopt auto_menu

# easy cd
setopt auto_cd

# history
export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

# usable another terminal history
setopt share_history

# custom aliases
alias ls='exa'
alias ll='ls -la'
alias cat='bat'
alias ps='procs'
alias grep='rg'
alias find='fd'
alias od='hexyl'
alias wc='tokei'

eval "$(starship init zsh)"
eval "$(anyenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"
