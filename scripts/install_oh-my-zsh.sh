#!/bin/bash

# References : 
# http://ohmyz.sh/

DOTFILESHOME=~/.dotfiles
source $DOTFILESHOME/scripts/handy_functions.sh

usage() {
  echo "Usage: " && \
  echo "install : ./install_oh-my-zsh.sh)"
}

# Via curl
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Via wget
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
