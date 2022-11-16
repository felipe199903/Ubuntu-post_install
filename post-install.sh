#!/bin/bash

# Goal: Script which automatically sets up a new Ubuntu Machine after installation
# This is a basic install, easily configurable to your needs

echo "Welcome! Let's start setting up your system. It could take more than 10 minutes, be patient"

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

echo 'Delete libreoffice'
sudo apt-get remove --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove

echo 'Installing gnome-tweak-tool'
sudo apt install gnome-tweaks

echo 'Installing OpenSSH'
sudo apt-get install openssh-server -y

echo 'Enable Firewall'
sudo ufw enable

# configure the firewall
sudo ufw allow OpenSSH

echo 'Installing htop'
sudo apt-get install -y htop

echo 'Installing vscode'
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

echo 'Installing curl' 
sudo apt-get install curl -y

echo 'Installing neofetch' 
sudo apt-get install neofetch -y

echo 'Installing jdk'
sudo apt install default-jdk
java -version

echo 'Installing python3-pip'
sudo apt-get install python3-pip -y

echo 'Installing python-software-properties'
sudo apt-get install -y python-software-properties

echo 'Installing Develop Tools Essentials'
sudo apt-get install -y gcc g++ make
sudo apt install -y build-essential

echo 'Installing postamn'
sudo snap install postman

echo 'Installing Discord'
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
sudo apt-get install -f -y && rm discord.deb

echo 'Installing OBS Studio'
sudo apt-get install ffmpeg && sudo snap install obs-studio

echo 'Installing Google Chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'Installing IntelliJ IDEA'
sudo snap install intellij-idea-ultimate --classic

echo 'Installing Visual Studio Code'
sudo snap install --classic code

echo 'Installing Eclipse IDE'
sudo snap install --classic eclipse

echo 'Installing ffmpeg'
sudo apt install ffmpeg

echo 'Enabling KVM'
sudo apt-get install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

sudo service ssh restart

echo 'Updating and Cleaning Unnecessary Packages'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
clear

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Felipe Schorles\""
read git_config_user_name

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"felipeschorles@outlook.com\""
read git_config_user_email

echo "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email

echo "
######################################################################################################
Post-installation of Ubuntu successfully executed! what was installed:

- system updates and upgrade
- gnome-tweak-tool
- openSSH install
- ufw config
- htop
- curl
- neofetch
- vscode
- jdk
- python3-pip
- python-software-properties
- developer tools essentials
- postman
- Eclipse IDE
- OBS Studio
- Google Chrome
- ffmpeg
- IntelliJ IDEA
- Visual Studio Code
- discord
- enable KVM
- system clean up after the install
######################################################################################################
"
