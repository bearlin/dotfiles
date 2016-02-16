#!/bin/bash

echo "### Running $0 ###"

DOTVIMHOME=~/.vim
source $DOTVIMHOME/scripts/handy_functions.sh
DOTFILESHOME=~/.dotfiles
CLANG_COMPLETE_CONFIG_FILES_HOME=$DOTFILESHOME/clang_complete
CLANG_COMPLETE_CONFIG_FILES_NAME_PREFIX=clang_complete
CLANG_COMPLETE_CONFIG_FILES_NAME_SUFFIX=basic

usage() {
  echo "Usage: " && \
  echo "Copy basic config file: ./copy_clang_complete-config-file-here.sh basic" && \
  echo "Copy example config file: ./copy_clang_complete-config-file-here.sh example"
}

if [ "$1" == "basic" ] ||
   [ "$1" == "example" ]; then
  echo "para=$1"
else
  usage
  die "Unknow parameters \"$1\", exit!"
fi

if [ -d $DOTFILESHOME ] &&
   [ -d $CLANG_COMPLETE_CONFIG_FILES_HOME ]; then
  if [ "$1" == "basic" ]; then
    CLANG_COMPLETE_CONFIG_FILES_NAME_SUFFIX=basic
  elif [ "$1" == "example" ]; then
    CLANG_COMPLETE_CONFIG_FILES_NAME_SUFFIX=example
  fi
  CLANG_COMPLETE_CONFIG_FILES_TO_COPY="$CLANG_COMPLETE_CONFIG_FILES_HOME/$CLANG_COMPLETE_CONFIG_FILES_NAME_PREFIX.$CLANG_COMPLETE_CONFIG_FILES_NAME_SUFFIX"
  echo "Copy [$CLANG_COMPLETE_CONFIG_FILES_TO_COPY] to [$PWD/.clang_complete]"

  cp $CLANG_COMPLETE_CONFIG_FILES_TO_COPY $PWD/.clang_complete
else
  warn "$DOTFILESHOME or $CLANG_COMPLETE_CONFIG_FILES_HOME doesn't exists."
  byebye "$@"
fi

byebye "$@"
