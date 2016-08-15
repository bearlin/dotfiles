# !/bin/bash
DOTFILESHOME=~/.dotfiles
source $DOTFILESHOME/scripts/handy_functions.sh

# References:
# http://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

usage() {
  echo "Usage: " && \
  echo "$0 [user.name] [user.email] [core.editor]"
}

if [ "$#" -lt 3 ]; then
  usage
  byebye "$@"
fi

# ---------------------------------------------------------------------------------
read -p "Do you want to delete your old ~/.gitconfig file? [y/n]: " DeleteGitconfig
if [ "$DeleteGitconfig" == "y" ]; then
  echo "Delete ~/.gitconfig..."
  rm ~/.gitconfig
fi
# ---------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------
echo "Beautiful colored and readable output..."
# Git tip: Beautiful colored and readable output
# http://www.leaseweblabs.com/2013/08/git-tip-beautiful-colored-and-readable-output/
# http://www.jianshu.com/p/331cd9fdeae7
echo "[alias]
	lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
	co = checkout
	br = branch
	rem = remote
	ci = commit
	st = status
[color]
	branch = auto
	diff = auto
	status = auto
	ui = auto
[color \"branch\"]
	current = yellow reverse
	local = yellow
	remote = green
[color \"diff\"]
	meta = yellow bold
	frag = magenta bold
	old = red bold
	new = green bold
[color \"status\"]
	added = yellow
	changed = green
	untracked = cyan" >> ~/.gitconfig
# ---------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------
echo "Add name/email/editor configurations..."
# Your Identity
if [ "$1" != "" ]; then
  git config --global user.name "$1"
fi
if [ "$2" != "" ]; then
  git config --global user.email "$2"
fi

# Your Editor
if [ "$3" != "" ]; then
  git config --global core.editor $3 
fi
# ---------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------
# Checking Your Settings
echo ""
echo "Your new ~/.gitconfig file content:"
echo "------------------------------------------"
cat ~/.gitconfig
echo "------------------------------------------"
echo ""
echo "Your current git config setting had been changed to:"
echo "------------------------------------------"
git config --list
echo "------------------------------------------"
# ---------------------------------------------------------------------------------

byebye "$@"
