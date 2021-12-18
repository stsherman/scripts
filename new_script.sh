#!/usr/bin/env bash


if [[ -z "${1+set}" ]]; then
    echo -e "Must provide a file name\n"
    echo "Usage:"
    echo "new_script.sh file"
    exit
fi

SCRIPT_NAME=$1
SCRIPT_DIRECTORY=${2:-~/Scripts}

if [[ "$SCRIPT_NAME" != *.sh ]]; then
    echo "Appending .sh to file name"
    SCRIPT_NAME="$SCRIPT_NAME.sh"
fi

SCRIPT_PATH=$SCRIPT_DIRECTORY/$SCRIPT_NAME

echo "Creating script: $SCRIPT_NAME in $(readlink -f "$SCRIPT_DIRECTORY")"

touch $SCRIPT_PATH
echo -e "#!/usr/bin/env bash\n" > $SCRIPT_PATH
chmod +x $SCRIPT_PATH
xdg-open $SCRIPT_PATH
