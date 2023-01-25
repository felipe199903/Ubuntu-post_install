# Post-installation of Ubuntu

Scripts to automate Ubuntu Post Install and tasks.
<br><br>

<p align="center">
  <img src=".github/linux.png">
</p>

# How to use
```
git clone https://github.com/felipe199903/Ubuntu-post_install.git
```
```
cd Ubuntu-post_install
```
```
sudo bash post-install.sh
```
# Whats on each for Post install
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
- ffmpeg
- OBS Studio
- Google Chrome
- IntelliJ IDEA
- Visual Studio Code
- discord
- enable KVM
- system clean up after the install

# Whats on each for Game-env
- Steam
- dependencies for Minecraft Server
- Wine
- Lutris

## Tips

Here are a few suggestions for improving the script:

Add comments to explain the purpose and function of each section of the script. This will make it easier for others (and yourself) to understand and modify the script in the future.

Refactor the script to use functions. This will make the script more organized and easier to read. For example, you could create a function that installs and configures a specific package, and call that function multiple times for different packages.

Use a package manager to install packages, rather than downloading them from the internet. This will make it easier to install, update, and remove packages, and also ensure that the packages are compatible with the system.

Add error handling and logging. For example, you could include a check to ensure that a package is successfully installed before proceeding to the next step, and log any errors that occur during the script's execution.

Limit the use of sudo in the script. It is safer to execute the script as the root user and it is not necessary to use sudo for every command.

Use apt-get instead of apt on Ubuntu, it is more compatible with older versions of Ubuntu.

Remove unnecessary steps, such as installing software properties common, installing libreoffice then uninstalling it, and installing both Visual Studio Code and Eclipse IDE twice.

Optimize the script to use fewer commands. For example, you can combine the apt-get update and apt-get upgrade commands into one command apt-get update && apt-get upgrade -y.

Use a dialog box for user inputs. This make the script more user-friendly, as it will guide the user through the process and ask for input in a more natural way, as opposed to using read.

Make sure the script is executable by running chmod +x <scriptname> before running it.

It is also important to mention that, since this script does a lot of things, it is important to test it multiple times and on different environments to make sure it works properly.
