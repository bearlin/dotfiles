#!/bin/bash

echo "### Running $0 ###"

RESULT_PREFIX="h_hpp_paths_"
LISTNAME_H="h-list"
LISTNAME_HPP="hpp-list"
LISTNAME_MERGED="h+hpp-list"
DOT_OUT=".out"
DOT_DIRNAME=".dirname"
DOT_UNIQUE=".unique"

FILE_H_LIST=$RESULT_PREFIX$LISTNAME_H$DOT_OUT
FILE_HPP_LIST=$RESULT_PREFIX$LISTNAME_HPP$DOT_OUT
FILE_H_HPP_LIST=$RESULT_PREFIX$LISTNAME_MERGED$DOT_OUT
FILE_DIRNAME=$FILE_H_HPP_LIST$DOT_DIRNAME
FILE_UNIQUE=$FILE_H_HPP_LIST$DOT_UNIQUE

echo "This script will try to get all path(s) under ./, this will be very usefull for .clang_complete."
echo "The path list output is ./get_all_h_hpp_paths.out"

echo "Collect file lists of all *.h and *.hpp..."
find . -name "*\.h" -type f > $FILE_H_LIST
find . -name "*\.hpp" -type f > $FILE_HPP_LIST

echo "Merge file lists..."
cp $FILE_H_LIST $FILE_H_HPP_LIST
cat $FILE_HPP_LIST >> $FILE_H_HPP_LIST

echo "Get directory path(s) by stripping filenames from full path(s)..."
ln=0
for line in `cat $FILE_H_HPP_LIST`; do
  ln=$((ln+1))
  if ! ((ln % 50)); then
    echo "[$ln] $line"
  fi
  dirname $line >> $FILE_DIRNAME
done

echo "Sort the path(s) to unique result..."
sort -u $FILE_DIRNAME > $FILE_UNIQUE

echo "Clean temp files..."
rm $FILE_H_LIST
rm $FILE_HPP_LIST
rm $FILE_H_HPP_LIST
rm $FILE_DIRNAME

echo "Convert path to .clang_complete format (prefix with a '-I')..."
cp $FILE_UNIQUE $FILE_UNIQUE.bak
sed -i'.bak' 's/^\./-I\./g' $FILE_UNIQUE
