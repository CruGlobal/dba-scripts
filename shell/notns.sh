#!/bin/bash
# This file created 9-22-14 to connnect to a database given the host and sid without using tnsnames.ora file entry.

echo -n "Enter the database sid (metap) : "
read dbsid
echo -n "Enter the user to connect as (ie. skohler) : "
read usename
echo -n "Enter the host name (ie. plorad01) : "
read hostname

if [ "$usename" = "sys" ]; then
# echo -n "Enter sys password : "
# read syspasswd
echo -n "connecting to $dbsid as sysdba"
rlwrap sqlplus -L "$usename@(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = $hostname.ccci.org)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = $dbsid.ccci.org))) as sysdba"
else
echo "connecting to $dbsid as $usename"
rlwrap sqlplus -L "$usename@(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = $hostname.ccci.org)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = $dbsid.ccci.org)))"
fi
