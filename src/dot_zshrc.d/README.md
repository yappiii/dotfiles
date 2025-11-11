# `.zshrc.d` Directory

This directory contains modular shell configuration files that are **sourced automatically** from `.zshrc`:

```zsh
for f in "$HOME/.zshrc.d"/*.zsh(.N); do source "$f"; done
