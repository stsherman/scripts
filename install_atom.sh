#!/usr/bin/env bash

# Get the URL for the latest release of atom from github
URL=`curl -s https://api.github.com/repos/atom/atom/releases/latest | awk -F\" '/browser_download_url.*.deb/{print $(NF-1)}'`
# Get the filename from the url
FILENAME=`echo $URL | rev | cut -d "/" -f1 | rev`
# Download the latest release to the tmp directory and install it using dpkg
curl --output /tmp/$FILENAME -L $URL && \
	sudo dpkg -i /tmp/$FILENAME && \
	rm /tmp/$FILENAME

