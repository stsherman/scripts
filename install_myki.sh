#!/usr/bin/env bash

curl --output /tmp/MYKI-latest-amd64.deb -L https://static.myki.com/releases/da/MYKI-latest-amd64.deb && \
  sudo dpkg -i /tmp/MYKI-latest-amd64.deb && \
  rm /tmp/MYKI-latest-amd64.deb
