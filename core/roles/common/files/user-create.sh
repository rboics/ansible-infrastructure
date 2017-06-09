# user_create.sh - Shell script to create users from a csv

cat /tmp/user-create.csv | grep -v "#" > /tmp/user-create.csv.1
mv /tmp/user-create.csv.1 /tmp/user-create.csv

# Sudoers group differs between RedHat and Debian-based distros. This gets
# around that.

group_command="cat /etc/sudoers | grep -v '#' | grep '%' | awk -F \
'[[:space:]]+' '{print $1}' | cut -d '%' -f2"

while read line
do
    username=$(echo $line | cut -d ',' -f1)
    password=$(echo $line | cut -d ',' -f2)
    admin=$(echo $line | cut -d ',' -f3)
    if [ "$admin" = "y" ]; then
        group=$($group_command)
#        useradd -G $group $username
        echo "Group: $group Username: $username"
    else
#        useradd $username
        echo "User: $username"
    fi
#    yes $password passwd $username
        echo "Password: $password"
done < /tmp/user-create.csv
