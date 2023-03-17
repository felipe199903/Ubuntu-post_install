echo "creation dev environment initiated, please wait for the end of the process."

# business folder 
mkdir www

# git config
echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Felipe Schorles\""
read git_config_user_name

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"felipeschorles@outlook.com\""
read git_config_user_email

echo "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email

