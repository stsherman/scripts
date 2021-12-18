#!/usr/bin/env bash

INITIAL_DIRECTORY=$(readlink -f .)

DOWNLOAD_URL=$(curl -s https://www.consoleroms.com/roms/ps2/yu-gi-oh-the-duelists-of-the-roses/download \
  | sed -ne 's/.*start after countdown, please[^"]*"\([^"]*\)".*/\1/p' \
  | awk '{gsub(/^ +| +$/,"")} {print $0}')

FILE_NAME=$(basename $DOWNLOAD_URL)
FILE_NAME=$(printf '%b' "${FILE_NAME//%/\\x}")

echo $FILE_NAME

cd ~/ROMs

wget -P ~/ROMs $DOWNLOAD_URL

file-roller -h "$FILE_NAME"

rm "./$FILE_NAME"

#wget -q -O - $DOWNLOAD_URL | file-roller -h -

#curl $DOWNLOAD_URL

#tar xzvf -C ~/ROMs/

cd $INITIAL_DIRECTORY
