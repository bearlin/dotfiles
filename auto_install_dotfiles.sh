#!/bin/bash

# References:
# [USING GIT AND GITHUB TO MANAGE YOUR DOTFILES](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)  
# [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)  
# [dotfiles.github.io - Your unofficial guide to dotfiles on GitHub](https://dotfiles.github.io/)  

HOMEDIR=~
DOTFILESREPOSITORY=https://github.com/bearlin/dotfiles.git      # dotfiles repository from my github.com
DOTFILESHOME=~/.dotfiles                                        # .dotfiles directory
DOTFILESBACKUP=~/.dots_backup                                   # old ~/.* backup
FILES_TO_BACKUP=".bashrc .bash_profile .bash_history .bash_logout .tmux.conf .minttyrc"  # list of files to move to DOTFILESBACKUP folder

PLATFORM=$1 # mac or cygwin
if [ "$1" == "" ]; then
  PLATFORM="ubuntu"
fi
echo "PLATFORM=$PLATFORM"

warn() {
  echo "$1" >&2
}
die() {
  warn "$1"
  exit 1
}
printCurrentScriptRuntimeInfo() {
  printf '\t'
  for argument in "$0 $@"
  do
    printf '%s ' $argument
  done
  printf '\n'
}
byebye() {
  echo -e "\t=======\t"
  printCurrentScriptRuntimeInfo "$@"
  echo -e "\tByeBye!\t"
  echo -e "\t=======\t"
  echo
  echo
  exit 0
}
usage() {
  echo "Usage: " && \
  echo "$0 [mac|ubuntu|cygwin]"
}

# Go to HOMEDIR
cd "$HOMEDIR"

# Create backup directory DOTFILESBACKUP
echo "Create backup directory $DOTFILESBACKUP"
rm -rf $DOTFILESBACKUP
mkdir -p $DOTFILESBACKUP

# Move any existing .dotfiles in HOMEDIR to DOTFILESBACKUP directory
echo "Move any existing BASH .dotfiles in $HOMEDIR to $DOTFILESBACKUP directory"
for file in $FILES_TO_BACKUP; do
  echo -e "\tMoving ~/$file to $DOTFILESBACKUP"
  mv ~/$file $DOTFILESBACKUP
done

# Move old DOTFILESHOME to DOTFILESBACKUP
echo "Move old DOTFILESHOME to DOTFILESBACKUP"
mv $DOTFILESHOME $DOTFILESBACKUP

# Clone the DOTFILESREPOSITORY to DOTFILESHOME
echo "Clone the $DOTFILESREPOSITORY to $DOTFILESHOME"
git clone "$DOTFILESREPOSITORY" "$DOTFILESHOME"

# Create symlinks from files in the DOTFILESHOME directory
# ==============================================================================
# For bash : 
# -----------------------------------------------------------------------
echo -e "\tCreating BASH symlinks..."
echo -e "ln -s $DOTFILESHOME/bash/bash_profile ~/.bash_profile"
echo -e "ln -s $DOTFILESHOME/bash/bash_history ~/.bash_history"
echo -e "ln -s $DOTFILESHOME/bash/bash_logout ~/.bash_logout"
echo -e "ln -s $DOTFILESHOME/bash/$PLATFORM/bashrc ~/.bashrc"
ln -s $DOTFILESHOME/bash/bash_profile ~/.bash_profile
ln -s $DOTFILESHOME/bash/bash_history ~/.bash_history
ln -s $DOTFILESHOME/bash/bash_logout ~/.bash_logout
ln -s $DOTFILESHOME/bash/$PLATFORM/bashrc ~/.bashrc
# -----------------------------------------------------------------------

# For tmux: 
# -----------------------------------------------------------------------
echo -e "\tCreating tmux symlinks..."
echo -e "ln -s $DOTFILESHOME/tmux/tmux.conf ~/.tmux.conf"
ln -s $DOTFILESHOME/tmux/tmux.conf ~/.tmux.conf
# -----------------------------------------------------------------------

# For mintty in cygwin environment: 
# -----------------------------------------------------------------------
if [ "$PLATFORM" == "cygwin" ]; then
  echo -e "\tCreating mintty symlinks..."
  echo -e "ln -s $DOTFILESHOME/mintty/minttyrc ~/.minttyrc"
  ln -s $DOTFILESHOME/mintty/minttyrc ~/.minttyrc
fi
# -----------------------------------------------------------------------
# ==============================================================================

cd -
byebye "$@" "bearlin's dotfiles is installed!"

