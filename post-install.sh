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

# Install OpenSSH
sudo apt-get install openssh-server -y

# Enable Firewall
sudo ufw enable 

# configure the firewall
sudo ufw allow OpenSSH

# install htop
sudo apt-get install -y htop

# install unzip
sudo apt install unzip

# install snap
sudo apt install snapd

#install teamview
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install -y ./teamviewer_amd64.deb

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

#install Nodejs 13
curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
sudo apt-get install -y nodejs
node -v

#install Develop Tools Essentials
sudo apt-get install -y gcc g++ make
sudo apt install -y build-essential

#install yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get -y update && sudo apt-get -y install yarn

#install Angular-cli
sudo npm install -y -g @angular/cli

# Automatic downloads of security updates
sudo apt-get install -y unattended-upgrades
echo "Unattended-Upgrade::Allowed-Origins {
#   "${distro_id}:${distro_codename}-security";
#//  "${distro_id}:${distro_codename}-updates";
#//  "${distro_id}:${distro_codename}-proposed";
#//  "${distro_id}:${distro_codename}-backports";
#Unattended-Upgrade::Automatic-Reboot "true"; 
#}; " >> /etc/apt/apt.conf.d/50unattended-upgrades

sudo service ssh restart  

# Cleanup
sudo apt autoremove
sudo apt clean 

echo "
######################################################################################################
Post-installation of Ubuntu successfully executed! what was installed:

- Sys updates 
- OpenSSH install
- Ufw config
- Htop
- Unzip
- Teamview
- Snap
- Vscode
- Git
- jdk
- python-software-properties
- Nodejs 13
- Developer Tools Essentials
- yarn
- Angular-cli
- Automatic security updates
- System Clean up after the install
######################################################################################################
"
exit 0