#!/bin/bash

###################################################################################################
# Name:         oratab_si.sh                                                                      #
# Description:  Print oratab formatted entries for all databases registered in CRS.               #
#               Use only on single instace (si) oracle restart instance.                          #
#               (For RAC systems use oratab_rac.sh)                                               #
#                                                                                                 #
###################################################################################################

grid_home=/app/19.0.0/grid
for resource in $($grid_home/bin/crsctl status resource -w "((TYPE = ora.database.type) AND (LAST_SERVER = $(hostname -s)))" | grep ^NAME | sed 's/.*=//'); do
    full_resource=$($grid_home/bin/crsctl status resource -w "((NAME = $resource) AND (LAST_SERVER = $(hostname -s)))" -f)
    db_name=$(echo "$full_resource" | grep ^DB_UNIQUE_NAME | awk -F= '{ print $2 }')
    ora_home=$(echo "$full_resource" | grep ^ORACLE_HOME= | awk -F= '{ print $2 }')
    printf "%s:%s:N\n" $db_name $ora_home
done
