#!/usr/bin/env bash

if [[ -z "${1+set}" ]]; then
    echo -e "Must provide an email address\n"
    echo "Usage:"
    echo "generate_ssh.sh EMAIL [FILE]"
    exit
fi

EMAIL=$1
FILE_NAME=${2:-"$HOME/.ssh/id_rsa$(echo $RANDOM | md5sum | head -c 5; echo;)"}

ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f $FILE_NAME
eval "$(ssh-agent -s)"
ssh-add $FILE_NAME
cat "$FILE_NAME.pub"
