#!/bin/bash

echo "### Running $0 ###"

DOTFILESHOME=~/.dotfiles

# Below name was from get_all_h_hpp_paths.sh
RESULT_PREFIX="h_hpp_paths_"
LISTNAME_MERGED="h+hpp-list"
DOT_OUT=".out"
DOT_UNIQUE=".unique"
FILE_H_HPP_LIST=$RESULT_PREFIX$LISTNAME_MERGED$DOT_OUT
FILE_UNIQUE=$FILE_H_HPP_LIST$DOT_UNIQUE

$DOTFILESHOME/scripts/clang_complete/copy_clang_complete-config-file-here.sh basic
$DOTFILESHOME/scripts/clang_complete/get_all_h_hpp_paths.sh

echo "Merge unique dirname file lists to current .clang_complete file..."
cat $FILE_UNIQUE >> .clang_complete
