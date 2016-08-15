# !/bin/bash

DOTFILESHOME=~/.dotfiles
source $DOTFILESHOME/scripts/handy_functions.sh

# References:
# https://github.com/bearlin/git_recipes

usage() {
  echo "Usage: " && \
  echo "This script will change all old.user.email to new.user.email for ALL commits in this branch " && \
  echo "$0 [old.user.email] [new.user.email]"
}

if [ "$#" -lt 2 ]; then
  usage
  byebye "$@"
fi

# ---------------------------------------------------------------------------------
read -p "Do you want to change your old.use.email ($1) to new.use.email ($2) for all commits in current branch? [y/n]: " UserInput
if [ "$UserInput" == "y" ]; then
  echo "Updating user.email for all commits..."
  # Generate bash script
  echo "# !/bin/bash
  git filter-branch -f --env-filter '
    if test \"\$GIT_AUTHOR_EMAIL\" = \"$1\"
    then
      GIT_AUTHOR_EMAIL=\"$2\"
      export GIT_AUTHOR_EMAIL
    fi
    if test \"$GIT_COMMITTER_EMAIL\" = \"$1\"
    then
      GIT_COMMITTER_EMAIL=\"$2\"
      export GIT_COMMITTER_EMAIL
    fi
    ' -- --all" > .git.change.use.email.sh
  # Execute the generated script
  ./.git.change.use.email.sh
  # Remove generatd script
  rm .git.change.use.email.sh
else
  echo "Do nothing..."
  byebye "$@"
fi
# ---------------------------------------------------------------------------------

byebye "$@"
