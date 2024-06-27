#!/usr/bin/env bash

source ./zsh/zshenv

# Install
if [ ! -f "$HOME/.zshenv" ]; then
  . "$DOTFILES/install/install-zsh.sh"
else
  echo "Skipping zsh config install: zsh env file present"
fi
if [ ! -f "$XDG_CONFIG_HOME/nvim" ]; then
  . "$DOTFILES/install/install-nvim.sh"
else
  echo "Skipping nvim config install: zsh config file present"
fi
