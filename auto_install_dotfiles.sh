#!/bin/bash

# References:
# [USING GIT AND GITHUB TO MANAGE YOUR DOTFILES](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)  
# [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)  
# [dotfiles.github.io - Your unofficial guide to dotfiles on GitHub](https://dotfiles.github.io/)  

HOMEDIR=~
DOTFILESREPOSITORY=https://github.com/bearlin/dotfiles.git  # dotfiles repository from my github.com
DOTFILESHOME=~/dotfiles                                     # dotfiles directory cloned from my github.com
DOTFILESBACKUP=~/dots_backup                                # old ~/.* backup
FILES="bashrc bash_profile bash_history"                    # list of files/folders to symlink in  home directory
PLATFORM=$1 # mac or cygwin
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
  echo "$0 [mac|cygwin]"
}

# Go to HOMEDIR
cd "$HOMEDIR"

# Create backup directory DOTFILESBACKUP
echo "Create backup directory $DOTFILESBACKUP"
rm -rf $DOTFILESBACKUP
mkdir -p $DOTFILESBACKUP
# Move any existing dotfiles in HOMEDIR to DOTFILESBACKUP directory
echo "Move any existing dotfiles in $HOMEDIR to $DOTFILESBACKUP directory"
for file in $FILES; do
    echo -e "\tMoving ~/.$file to $DOTFILESBACKUP"
    mv ~/.$file $DOTFILESBACKUP
done
# Move old DOTFILESHOME to DOTFILESBACKUP
echo "Move old DOTFILESHOME to DOTFILESBACKUP"
mv $DOTFILESHOME $DOTFILESBACKUP

# Clone the DOTFILESREPOSITORY to DOTFILESHOME
echo "Clone the $DOTFILESREPOSITORY to $DOTFILESHOME"
git clone "$DOTFILESREPOSITORY" "$DOTFILESHOME"

# Create symlinks from any files in the DOTFILESHOME directory specified in $files
for file in $FILES; do
    echo -e "\tCreating symlink : ln -s $DOTFILESHOME/bash/$PLATFORM/$file ~/.$file"
    ln -s $DOTFILESHOME/bash/$PLATFORM/$file ~/.$file
done

cd -
byebye "$@" "bearlin's dotfiles is installed!"

