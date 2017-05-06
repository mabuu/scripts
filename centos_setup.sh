RED='\033[0;31m'
NC='\033[0m' # No Color

printf "\n${RED}Installing packages...${NC}\n"
yum update -y
yum install tmux vim zsh -y

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

printf "\n${RED}Changing default shell to zsh...${NC}\n"
chsh --shell /bin/zsh

printf "\n${RED}=> NOTE: PLEASE RESTART YOUR SHELL${NC}\n"

