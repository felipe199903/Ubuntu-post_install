echo "create user, what is user name?"
read username
# create user
sudo adduser $username

echo "user: " $username "created with success"

# add user to sudo group
sudo usermod -aG sudo $username