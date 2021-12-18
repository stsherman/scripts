#!/usr/bin/env bash

# Example
# list_smb_shares.sh 10.10.10.27

smbclient -N -L \\\\$1\\
