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
        | awk -F ' ' '{print $1}' | cut -d '%' -f2)
        # ...but in Ubuntu, /etc/sudoers contains both the admin and sudo group
        # even though only the sudo group is auto-created. Detect if this
        # is an Ubuntu system, and manually set group to sudo if it is.
        if [ -e /etc/lsb-release ]; then
            group="sudo"
        fi
        useradd -G $group -m -s /bin/bash $username
    else
        useradd -m -s /bin/bash $username
    fi
    # This is an old unix utility that just continuously echoes out the
    # password into the passwd utility.
    yes $password | passwd $username
done < /tmp/user-create.csv
