#!/usr/bin/env bash

curl --output /tmp/steam.deb -L https://cdn.akamai.steamstatic.com/client/installer/steam.deb && \
	sudo dpkg -i /tmp/steam.deb && \
	rm /tmp/steam.deb
