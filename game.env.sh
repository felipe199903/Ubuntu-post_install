echo "Welcome! Let's start setting up your system. It could take more than 10 minutes, be patient"

# Ensure system is up to date
sudo apt-get update -y

# Upgrade the system
sudo apt-get upgrade -y

echo 'Installing Steam'
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
sudo apt install ./steam.deb

echo 'Installing dependencies for Minecraft Server'
sudo apt install git build-essential
sudo apt install openjdk-11-jre-headless

echo 'Installing Wine'
sudo dpkg --add-architecture i386
sudo apt update
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt install software-properties-common
sudo apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"
wine --version