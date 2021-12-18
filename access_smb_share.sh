#!/usr/bin/env bash

# Example
# access_smb_share.sh 10.10.10.27 backups
# dir
# get prod.dtsConfig

smbclient -N \\\\$1\\$2

