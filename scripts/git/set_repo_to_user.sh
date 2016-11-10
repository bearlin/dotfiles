# !/bin/bash
DOTFILESHOME=~/.dotfiles
source $DOTFILESHOME/scripts/handy_functions.sh

usage() {
  echo "This script let you update the 'user.name' and 'user.email' for specific" && \
  echo "repo and won't affect global setting, so please SWITCH TO YOUR GIT REPO" && \
  echo "before using this script: " && \
  echo "Usage: " && \
  echo "$0 [user.name] [user.email]"
}

if [ "$#" -lt 2 ]; then
  usage
  byebye "$@"
fi

# ---------------------------------------------------------------------------------
echo "Add name/email configurations..."
# Your Identity
if [ "$1" != "" ]; then
  git config user.name "$1"
fi
if [ "$2" != "" ]; then
  git config user.email "$2"
fi
# ---------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------
# Checking Your Settings
echo ""
# echo "Your current git config setting had been changed to:"
echo "------------------------------------------"
# git config --list

echo "New user.name and user.email:"
git config user.name
git config user.email
echo "------------------------------------------"
# ---------------------------------------------------------------------------------

byebye "$@"
