echo "Welcome! Let's start setting up your system. It could take more than 10 minutes, be patient"

# Ensure system is up to date
sudo apt-get update -y

# Upgrade the system
sudo apt-get upgrade -y

echo 'Installing Steam'
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
sudo apt install ./steam.deb

# Install OpenJDK 11
echo 'Installing OpenJDK 11'
sudo apt install openjdk-11-jre-headless

# Install Wine
echo 'Installing Wine'
sudo dpkg --add-architecture i386
sudo apt update
wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt install software-properties-common
sudo apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"
wine --version

# Install Lutris
echo 'Installing Lutris'
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris