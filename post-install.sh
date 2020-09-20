#!/bin/bash

# Goal: Script which automatically sets up a new Ubuntu Machine after installation
# This is a basic install, easily configurable to your needs

# Test to see if user is running with root privileges.
if [[ "${UID}" -ne 0 ]]
then
 echo 'Must execute with sudo or root' >&2
 exit 1
fi

# Ensure system is up to date
sudo apt-get update -y

# Upgrade the system
sudo apt-get upgrade -y
sudo apt install software-properties-common

# Upgrade the system
sudo apt-get dist-upgrade -y

# Install gnome-tweak-tool
sudo apt install gnome-tweaks

# Install OpenSSH
sudo apt-get install openssh-server -y

# Enable Firewall
sudo ufw enable

# configure the firewall
sudo ufw allow OpenSSH

# install htop
sudo apt-get install -y htop

# install snap
sudo apt install snapd

# install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# install git
sudo apt install -y git

# install jdk
sudo apt install default-jdk
java -version

# install python-software-properties to use Nodejs
sudo apt-get install -y python-software-properties

#install Nodejs 12 (LTS)
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt-get install -y nodejs
node -v

#install Develop Tools Essentials
sudo apt-get install -y gcc g++ make
sudo apt install -y build-essential

#install yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get -y update && sudo apt-get -y install yarn

#install sublime-text
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install -y sublime-text

#install postamn
sudo snap install postman

sudo service ssh restart

# Cleanup
sudo apt autoremove
sudo apt clean

echo "
######################################################################################################
Post-installation of Ubuntu successfully executed! what was installed:

- System updates and upgrade
- Gnome-tweak-tool
- OpenSSH install
- Ufw config
- Htop
- Snap
- Vscode
- Git
- jdk
- python-software-properties
- nodejs 12 (LTS)
- Developer Tools Essentials
- yarn
- sublime-text
- postman
- System Clean up after the install
######################################################################################################
"