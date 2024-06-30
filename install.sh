#!/usr/bin/env bash

[ ! -f env_config ] && cp env_config.dist env_config
source ./zsh/zshenv

# Install
if [ ! -f "$HOME/.zshenv" ]; then
  . "$DOTFILES/install/install-zsh.sh"
else
  echo "Skipping zsh config install: .zshenv file present"
fi

if [ ! -f "$XDG_CONFIG_HOME/nvim" ]; then
  . "$DOTFILES/install/install-nvim.sh"
else
  echo "Skipping nvim config install: config folder present"
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
  . "$DOTFILES/install/install-tmux.sh"
else
  echo "Skipping tmux config install: config file present"
fi

if [ ! -d "$XDG_CONFIG_HOME/direnv" ]; then
  . "$DOTFILES/install/install-direnv.sh"
else
  echo "Skipping direnv config install: config folder present"
fi
