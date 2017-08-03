#!/usr/bin/env bash

echo "***************************************************"
echo 'Checking Zsh installation... '
echo "***************************************************"
if ! dpkg -s zsh; then
  # Install and set Zsh as shell
  sudo apt-get update && sudo apt-get upgrade -y
  sudo apt-get install -y zsh

  # Install Oh-My-Zsh!
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

  # Change the oh my zsh default theme.
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="fino"/g' ~/.zshrc
  sed -i 's/plugins=(git)"/plugins=(git dirhistory common-aliases command-not-found)/g' ~/.zshrc

  # Change shell to Zsh for the ubuntu user
  sudo chsh -s /bin/zsh ubuntu
fi
