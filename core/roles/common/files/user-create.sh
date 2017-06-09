#!/bin/bash

# user_create.sh - Shell script to create users from a csv

while read line
do
    username=$(echo $line | cut -d ',' -f1)
    password=$(echo $line | cut -d ',' -f2)
    admin=$(echo $line | cut -d ',' -f3)
    if [ "$admin" = "y" ]; then
        # The sudoers group varies between Red Hat and Debian based distros.
        # This automatically finds out what group is specified in /etc/sudoers.
        group=$(cat /etc/sudoers | grep -v '#' | grep '%' \
        | awk -F '[[:space:]]+' '{print $1}' | cut -d '%' -f2)
        useradd -G $group $username
    else
        useradd $username
    fi
    # This is an old unix utility that just continuously echoes out the
    # password into the passwd utility.
    yes $password | passwd $username
done < /tmp/user-create.csv
