echo "create user, what is user name?"
read username
# create user
sudo adduser $username

echo "user: " $username "created with success"

echo "add" $username "to SUDO group? (y - yes or n - no)"
read addRoot

if [ $addRoot == 'y' ]
then
    # add user to sudo group
    sudo usermod -aG sudo $username
fi

# list users
cut -d: -f1 /etc/passwd