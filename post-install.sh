echo "Welcome! Let's start setting up your system. It could take more than 10 minutes, be patient"

# Test to see if user is running with root privileges.
if [[ "${UID}" -ne 0 ]]
then
 echo 'Must execute with sudo or root' >&2
 exit 1
fi

# Ensure system is up to date and upgrade
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'

# Install software-properties-common
echo 'Installing software-properties-common'
sudo apt install software-properties-common -y

# Delete LibreOffice
echo 'Delete libreoffice'
sudo apt-get remove --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove

# Install Gnome Tweak Tool
echo 'Installing gnome-tweak-tool'
sudo apt install gnome-tweaks

# Install OpenSSH
echo 'Installing OpenSSH'
sudo apt-get install openssh-server -y

# Enable Firewall
echo 'Enable Firewall'
sudo ufw enable

# configure the firewall
echo 'Configuring the firewall'
sudo ufw allow OpenSSH

# Install htop
echo 'Installing htop'
sudo apt-get install -y htop

# Install visual studio code
echo 'Installing visual studio code'
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# Install curl
echo 'Installing curl' 
sudo apt-get install curl -y

# Install neofetch
echo 'Installing neofetch' 
sudo apt-get install neofetch -y

# Install  Develop Tools Essentials
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

echo 'Installing ffmpeg'
sudo apt install ffmpeg

sudo service ssh restart

echo 'Updating and Cleaning Unnecessary Packages'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
clear

echo "
######################################################################################################
Post-installation of Ubuntu successfully executed! what was installed:

- system updates and upgrade
- openSSH install
- ufw config
- htop
- curl
- neofetch
- Visual Studio Code
- jdk
- developer tools essentials
- Postman
- OBS Studio
- Google Chrome
- ffmpeg
- IntelliJ IDEA
- Discord
- system clean up after the install
######################################################################################################
"