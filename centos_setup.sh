RED='\033[0;31m'
NC='\033[0m' # No Color
perform_update=false

clear
printf "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n"
printf "┃  Welcome! This script will set up basic terminal configurations.  ┃\n"
printf "┃                                                                   ┃\n"
printf "┃  Author:     mabuu          created at:     06.05.2017            ┃\n"
printf "┃                             changed at:     06.05.2017            ┃\n"
printf "┃                                                                   ┃\n"
printf "┃  Git-Repo:   https://github.com/mabuu/scripts.git                 ┃\n"
printf "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n"

read -p "Do you want to perform package updates before continueing? [yn] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]] ; then
  perform_update=true    
fi


if [ "$perform_update" = true ] ; then
printf "\n${RED}Updating installed packages...${NC}\n"
yum update -y
fi

printf "\n${RED}Installing packages [tmux, vim, zsh]...${NC}\n"
yum install tmux vim zsh -y

#printf "\n${RED}Installing and configuring oh-my-zsh...${NC}\n"
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#making config...

printf "\n${RED}Downloading config files...${NC}\n"
rm -rf ~/.config
mkdir ~/.config
cd ~/.config
git clone https://github.com/mabuu/terminal_configs.git

printf "\n${RED}Copying config files...${NC}\n"
cd ~
touch ~/.zshrc_local
ln -s ~/.config/terminal_configs/.zshrc .zshrc
ln -s ~/.config/terminal_configs/.tmux.conf .tmux.conf
ln -s ~/.config/terminal_configs/.vimrc .vimrc

printf "\n${RED}Changing default shell to zsh...${NC}\n"
chsh --shell /bin/zsh

printf "\n${RED}=> NOTE: PLEASE RESTART YOUR SHELL${NC}\n"

