#!/usr/bin/env bash

if [[ -d $1 ]]; then
    find $1 -type f -print0 | xargs -0 shred -vfzu -n 45
    rm -rf $1
elif [[ -f $1 ]]; then
    shred -vfzu -n 45 $1
else
    echo "$1 must be a file or directory"
    exit 1
fi

