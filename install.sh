#!/usr/bin/env bash

[ ! -f env_config ] && cp env_config.dist env_config

source ./colors.sh
source ./zsh/zshenv

CHECKMARK="\xE2\x9C\x94"

check_if_installed () {
  if command -v $1 >/dev/null 2>&1; then
    echo -e "${green}$CHECKMARK ${default}${1} present"
  else
    echo -e "${red}! ${default}${1} not found"
  fi
}

install_config_text () {
  echo -e "${green}$CHECKMARK ${default}Installing ${1} config"
}

skip_install_text () {
  echo -e "${yellow}! ${default}Skipping ${1} config install: config already present"
}

echo -e "${yellow}!!! ${red}WARNING${yellow} !!!"
echo -e "${light_red}This script could lead to corruptions of existing configurations!"
echo -e "${light_red}Use it at your own risks."

if [ $# -ne 1 ] || [ "$1" != "-y" ];
    then
        echo -e "${yellow}Press a key to continue..."
        read key;
fi

echo -e "${default}"
echo "----------------------------"
echo "Check for installed programs"
echo "----------------------------"
check_if_installed "zsh"
check_if_installed "kitty"
check_if_installed "nvim"
check_if_installed "tmux"
check_if_installed "direnv"

echo ""
echo "----------------------------"
echo "Install configurations"
echo "----------------------------"

# Install
if [ ! -f "$HOME/.zshenv" ]; then
  . "$DOTFILES/install/install-zsh.sh"
  install_config_text "zsh"
else
  skip_install_text "zsh"
fi

if [ ! -d "$XDG_CONFIG_HOME/kitty" ]; then
  . "$DOTFILES/install/install-kitty.sh"
  install_config_text "kitty"
else
  skip_install_text "kitty"
fi

if [ ! -f "$XDG_CONFIG_HOME/nvim/init.lua" ]; then
  . "$DOTFILES/install/install-nvim.sh"
  install_config_text "nvim"
else
  skip_install_text "nvim"
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
  . "$DOTFILES/install/install-tmux.sh"
  install_config_text "tmux"
else
  skip_install_text "tmux"
fi

if [ ! -d "$XDG_CONFIG_HOME/direnv" ]; then
  . "$DOTFILES/install/install-direnv.sh"
  install_config_text "direnv"
else
  skip_install_text "direnv"
fi
