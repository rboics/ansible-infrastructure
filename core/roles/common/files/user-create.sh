# user_create.sh - Shell script to create users from a csv

cat /tmp/users.csv | grep -v "#" > /tmp/users.csv.1
mv /tmp/users.csv.1 /tmp/users.csv

# Sudoers group differs between RedHat and Debian-based distros. This gets
# around that.

group_command="cat /etc/sudoers | grep -v '#' | grep '%' | awk -F \
'[[:space:]]+' '{print $1}' | cut -d '%' -f2"

for line in file
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
done < /tmp/users.csv
