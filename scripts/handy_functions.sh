################################################################################
# This file was copied from :
#     https://github.com/bearlin/dotvim/blob/master/scripts/handy_functions.sh
# Please update if needed.
################################################################################

#!/bin/bash

# Usage: Other scripts can include functions of this file using:
# DOTVIMHOME=~/.vim
# source $DOTVIMHOME/scripts/handy_functions.sh

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
  exit 0
}

hasCommandWget() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which wget &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandCurl() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which curl &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandUnzip() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which unzip &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandCscope() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which cscope &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandCtags() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which ctags &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandGtags() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which gtags &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandHtags() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which htags &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
hasCommandGit() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  retval=0
  which git &>/dev/null
  if [ $? -eq 0 ]; then
    retval=1
  fi
  return "$retval"
}
setFlagsHasWgetHasCurlAndExitIfBothEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandWget
  hasWget=$?
  hasCommandCurl
  hasCurl=$?
  if [ $hasWget == 0 ] && [ $hasCurl == 0 ]; then
    byebye "$@" "Both wget/crul commands not found, please install one of them first."
  fi
}
setFlagsHasUnzipAndExitIfEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandUnzip
  hasUnzip=$?
  if [ $hasUnzip == 0 ]; then
    byebye "$@" "unzip commands not found, please install unzip first."
  fi
}
setFlagsHasCscopeAndExitIfEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandCscope
  hasCscope=$?
  if [ $hasCscope == 0 ]; then
    byebye "$@" "cscope commands not found, please install cscope first."
  fi
}
setFlagsHasCtagsAndExitIfEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandCtags
  hasCtags=$?
  if [ $hasCtags== 0 ]; then
    byebye "$@" "ctags commands not found, please install ctags first."
  fi
}
setFlagsHasGtagsAndExitIfEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandGtags
  hasGtags=$?
  if [ $hasGtags == 0 ]; then
    byebye "$@" "gtags commands not found, please install gtags first."
  fi
}
setFlagsHasHtagsAndExitIfEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandHtags
  hasHtags=$?
  if [ $hasHtags == 0 ]; then
    byebye "$@" "gtags commands not found, please install gtags first."
  fi
}
setFlagsHasGitAndExitIfEqualZero() {
  # Ref: http://stackoverflow.com/questions/8742783/returning-value-from-called-function-in-shell-script
  hasCommandGit
  hasGit=$?
  if [ $hasGit == 0 ]; then
    byebye "$@" "git commands not found, please install git first."
  fi
}
