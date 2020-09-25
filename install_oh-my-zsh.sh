#!/data/data/com.termux/files/usr/bin/bash

apt update
apt install ruby -y
gem install lolcat
apt install -y git zsh figlet | lolcat

cd $HOME

clear

git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh --depth 1 | lolcat

printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-oh-my-zsh${NORMAL}\n";
    mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

printf "${BLUE}Using the Oh My Zsh template file and adding it to ~/.zshrc${NORMAL}\n"
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
sed -i '/^ZSH_THEME/d' $HOME/.zshrc
printf "${BLUE}Adding the agnoster theme which you can change later to anything in the ~/.zshrc${NORMAL}\n"
sed -i '1iZSH_THEME="agnoster"' $HOME/.zshrc
printf "${BLUE}Making zsh your default shell using 'chsh'${NORMAL}\n"
chsh -s zsh

figlet -f script -c "Done! " | lolcat

printf "${GREEN}"
  echo '         __                         ________                                    '
  echo '  ____  / /_     ____ ___  __  __  /__   __/____  _ ____ ____ ___   __  __      '
  echo ' / __ \/ __ \   / __ `__ \/ / / /     / /  /___ /| |___// __ `__ \ / / / / \\// '
  echo '/ /_/ / / / /  / / / / / / /_/ /     / /  /  __/ / /   / / / / / // /_/ /   \   '
  echo '\____/_/ /_/  /_/ /_/ /_/\__, /     /_/  /___/  / /   /_/ /_/ /_//_____/  //\\  '
  echo '                        /____/                                                  ....is now installed!'
  echo ''
  echo ''
  echo 'Please look over the ~/.zshrc file to select plugins, themes, and options.'
  echo ''
  echo 'Please restart Termux app...'
  echo ''
printf "${NORMAL}"

exit
