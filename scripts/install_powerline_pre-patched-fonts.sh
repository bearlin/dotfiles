#!/bin/bash

DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh
DOTFILESHOME=~/.dotfiles
TEMP_DIR=~/.temp/powerlinefonts

usage() {
  echo "Usage: " && \
  echo "Install font files: ./install_powerline_pre-patched-fonts.sh" && \
  echo "Re-install font files: ./install_powerline_pre-patched-fonts.sh force (NOTE: this will force remove $TEMP_DIR)"
}

if [ "$1" == "force" ] ||
   [ "$1" == "" ]; then
  echo "para=$1"
else
  usage
  die "Unknow parameters \"$1\", exit!"
fi

hasGit=0
setFlagsHasGitAndExitIfEqualZero "$@"
echo "hasGit=$hasGit"

if [ "$1" == "force" ]; then
  echo "Force remove $TEMP_DIR"
  rm -rf $TEMP_DIR
fi

if [ -d $TEMP_DIR ]; then
  warn "$TEMP_DIR already exists."
  byebye "$@"
fi

mkdir -p $TEMP_DIR
cd $TEMP_DIR
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd -

byebye "$@"
