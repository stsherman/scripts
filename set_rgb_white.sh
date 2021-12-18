#!/usr/bin/env bash


# Set all that suport Direct mode
openrgb -m Direct -c FFFFFF
# GPU does not support Direct, use static instead
openrgb -d 2 -m Static -c FFFFFF
