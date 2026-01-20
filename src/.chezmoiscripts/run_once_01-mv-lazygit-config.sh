#!/bin/bash

if [ -f ~/.config/lazygit/config.yml ]; then
  cp ~/.config/lazygit/config.yml ~/Library/Application\ Support/lazygit
fi
