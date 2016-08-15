# !/bin/bash

DOTFILESHOME=~/.dotfiles
source $DOTFILESHOME/scripts/handy_functions.sh

# References:
# https://github.com/bearlin/git_recipes

usage() {
  echo "Usage: " && \
  echo "This script will change all old.user.name to new.user.name for ALL commits in this branch " && \
  echo "$0 [old.user.name] [new.user.name]"
}

if [ "$#" -lt 2 ]; then
  usage
  byebye "$@"
fi

# ---------------------------------------------------------------------------------
read -p "Do you want to change your old.use.name ($1) to new.use.name ($2) for all commits in current branch? [y/n]: " UserInput
if [ "$UserInput" == "y" ]; then
  echo "Updating user.name for all commits..."
  # Generate bash script
  echo "# !/bin/bash
  git filter-branch -f --env-filter '
    if test \"\$GIT_AUTHOR_NAME\" = \"$1\"
    then
      GIT_AUTHOR_NAME=\"$2\"
      export GIT_AUTHOR_NAME
    fi
    if test \"\$GIT_COMMITTER_NAME\" = \"$1\"
    then
      GIT_COMMITTER_NAME=\"$2\"
      export GIT_COMMITTER_NAME
    fi
    ' -- --all" > .git.change.use.name.sh
  # Execute the generated script
  ./.git.change.use.name.sh
  # Remove generatd script
  rm .git.change.use.name.sh
else
  echo "Do nothing..."
  byebye "$@"
fi
# ---------------------------------------------------------------------------------

byebye "$@"
