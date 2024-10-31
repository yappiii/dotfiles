#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# From dot_Brewfile
brew bundle --file ~/dotfiles/src/dot_Brewfile

# Install anyenv plugins
anyenv install --init
anyenv install nodenv
anyenv install pyenv
anyenv install rbenv
anyenv install goenv

# Install Node.js
nodenv install 20.16.0

# Install Python
pyenv install 3.13.0

# Install Ruby
LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib" rbenv install 3.2.5

# Install go
goenv install 1.23.2

# Install LSP servers
gem install solargraph
go get golang.org/x/tools/gopls@latest

# aws-cli
python -m pip install awscli

# neovim
python -m pip install neovim

# gcloud cli
curl https://sdk.cloud.google.com | bash
