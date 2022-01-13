#!/bin/bash

# References:
# [USING GIT AND GITHUB TO MANAGE YOUR DOTFILES](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)  
# [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)  
# [dotfiles.github.io - Your unofficial guide to dotfiles on GitHub](https://dotfiles.github.io/)  

HOMEDIR=~
DOTFILESREPOSITORY=git@github.com:bearlin/dotfiles.git          # dotfiles repository from my github.com
DOTFILESHOME=~/.dotfiles                                        # .dotfiles directory
DOTFILESBACKUP=~/.dots_backup                                   # old ~/.* backup
FILES_TO_BACKUP=".bashrc \
                 .bash_profile \
                 .bash_logout \
                 .tmux.conf \
                 .minttyrc \
                 .globalrc \
                 .zshrc \
                 .gitconfig"  # list of files to move to DOTFILESBACKUP folder

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
echo -e "ln -s $DOTFILESHOME/bash/bash_logout ~/.bash_logout"
echo -e "ln -s $DOTFILESHOME/bash/$PLATFORM/bashrc ~/.bashrc"
ln -s $DOTFILESHOME/bash/bash_profile ~/.bash_profile
ln -s $DOTFILESHOME/bash/bash_logout ~/.bash_logout
ln -s $DOTFILESHOME/bash/$PLATFORM/bashrc ~/.bashrc
# -----------------------------------------------------------------------

# For tmux:
# -----------------------------------------------------------------------
if [ "$PLATFORM" == "mac" ]; then
  echo -e "\tPlease 'brew install reattach-to-user-namespace' to prevent 'MacOSX programs pbpaste and pbcopy under tmux does not work' issue..."
  echo -e "\tRef: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard"
  read -p "Run 'brew install reattach-to-user-namespace'?: (y)" userinput
  echo "userinput=$userinput"

  if [ "$userinput" == "y" ]; then
    brew install reattach-to-user-namespace
  fi
fi
echo -e "\tCreating tmux symlinks..."
echo -e "ln -s $DOTFILESHOME/tmux/tmux.conf ~/.tmux.conf"
ln -s $DOTFILESHOME/tmux/tmux.conf ~/.tmux.conf
# -----------------------------------------------------------------------

# For mintty/global in cygwin environment:
# -----------------------------------------------------------------------
if [ "$PLATFORM" == "cygwin" ]; then
  # mintty
  echo -e "\tCreating minttyrc symlinks..."
  echo -e "ln -s $DOTFILESHOME/mintty/minttyrc ~/.minttyrc"
  ln -s $DOTFILESHOME/mintty/minttyrc ~/.minttyrc

  # GNU Global
  echo -e "\tCreating globalrc symlinks..."
  echo -e "ln -s $DOTFILESHOME/global/globalrc ~/.globalrc"
  # WARNING : Use symlinks will cause issue that gtags can't read ~/.globalrc
  # correctly, so just copy globalrc to ~/.globalrc
  # ln -s $DOTFILESHOME/global/globalrc ~/.globalrc
  cp $DOTFILESHOME/global/globalrc ~/.globalrc

  # If you want to build GNU Global from source:
  # https://github.com/bearlin/study_build_gnu_global_from_source
fi
# -----------------------------------------------------------------------

# For gitconfig:
# -----------------------------------------------------------------------
echo -e "\tCreating gitconfig symlinks..."
echo -e "ln -s $DOTFILESHOME/git/gitconfig.default ~/.gitconfig"
ln -s $DOTFILESHOME/git/gitconfig.default ~/.gitconfig
# -----------------------------------------------------------------------

# For zshrc:
# -----------------------------------------------------------------------
echo -e "\tCreating zshrc symlinks..."
echo -e "ln -s $DOTFILESHOME/zsh/$PLATFORM/zshrc ~/.zshrc"
ln -s $DOTFILESHOME/zsh/$PLATFORM/zshrc ~/.zshrc

# Install oh-my-zsh first (MOVE TO README)
# echo -e "\tInstalling ~/.oh-my-zsh, this will overwrite ~/.zshrc, so remember to symlinks ~/.zshrc to $DOTFILESHOME/zsh/$PLATFORM/zshrc again"
# sh $DOTFILESHOME/scripts/install_oh-my-zsh.sh
# -----------------------------------------------------------------------

# ==============================================================================

cd -
byebye "$@" "bearlin's dotfiles is installed!"

