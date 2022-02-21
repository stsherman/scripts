#!/usr/bin/env bash

sudo apt-get upgrade -y
sudo apt-get update -y
sudo apt-get install -y \
	curl \
	zsh \
	git \
	wget \
	lm-sensors \
	nvme-cli \
	docker \
	default-jre
sudo apt-get autoremove -y
