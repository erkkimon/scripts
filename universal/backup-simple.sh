#!/bin/bash

# MySQL login information
mysql_username=""
mysql_user_password=""
mysql_db_name=""

# Site address will be included in the file name of the backup
site_address=""

# Absolute path to the directory in which the backups will be stored.
# The path is defined with slash in the end of the path (ie. 
# /home/user/public_html/). The directory must exist.
dir_for_backups=""

# The absolute location of the files of the site to be backed up.
# No need for slash at the end, but it's recommended to put it there.
dir_to_be_backed_up=""

timestamp=$(date +%y%m%d)

mysqldump       -u${mysql_username} -p${mysql_user_password} \
                ${mysql_db_name} > \
                ${dir_for_backups}${site_address}_db_${timestamp}.sql

tar cjf         ${dir_for_backups}${site_address}_db_${timestamp}.sql.tbz \
                ${dir_for_backups}${site_address}_db_${timestamp}.sql \
                && rm ${dir_for_backups}${site_address}_db_${timestamp}.sql

tar cjf         ${dir_for_backups}${site_address}_files_${timestamp}.tbz \
                ${dir_to_be_backed_up}
