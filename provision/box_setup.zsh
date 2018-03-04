#!/usr/bin/env zsh

# Set language configuration #################################################3

echo "***************************************************"
echo "Setting user language configuration...             "
echo "***************************************************"

echo '# Set locale configuration' >> ~/.profile
echo 'export LC_ALL=en_US.UTF-8' >> ~/.profile
echo 'export LANG=en_US.UTF-8' >> ~/.profile
echo 'export LANGUAGE=en_US.UTF-8' >> ~/.profile
echo "\n" >>  ~/.profile


# Install and setup PostgreSQL ################################################

echo "***************************************************"
echo "Checking Postgres installation..."
echo "***************************************************"
if ! dpkg -s postgresql; then
  echo "Installing PostgreSQL"
  sudo apt-get update
  sudo apt-get install -y postgresql postgresql-contrib

  echo "Setting up user"
  sudo -u postgres bash -c "psql -c \"CREATE USER vagrant WITH PASSWORD 'vagrant';\""
  sudo -u postgres bash -c "psql -c \"ALTER USER vagrant WITH SUPERUSER;\""

  echo "Starting Postgres server"
  sudo service postgresql start
fi


# Install Redis ###############################################################

echo "***************************************************"
echo "Checking Redis installation..."
echo "***************************************************"
if ! dpkg -s redis-server; then
  echo "Instalating Redis"
  sudo apt-get install -y redis-server
fi

# Install Node Version Manager ################################################

echo "***************************************************"
echo "Checking for NVM... "
echo "***************************************************"
if [[ ! -x "$HOME/.nvm" ]]; then
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

  echo '# Node Version Manager' >> ~/.profile
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.profile
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.profile
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.profile
  echo "\n" >>  ~/.profile
  echo 'autoload -U add-zsh-hook' >> ~/.profile
  echo 'load-nvmrc() {' >> ~/.profile
  echo '  local node_version="$(nvm version)"' >> ~/.profile
  echo '  local nvmrc_path="$(nvm_find_nvmrc)"' >> ~/.profile
  echo "\n" >>  ~/.profile
  echo '  if [ -n "$nvmrc_path" ]; then' >> ~/.profile
  echo '    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")' >> ~/.profile
  echo "\n" >>  ~/.profile
  echo '    if [ "$nvmrc_node_version" = "N/A" ]; then' >> ~/.profile
  echo '      nvm install' >> ~/.profile
  echo '    elif [ "$nvmrc_node_version" != "$node_version" ]; then' >> ~/.profile
  echo '      nvm use' >> ~/.profile
  echo '    fi' >> ~/.profile
  echo '  elif [ "$node_version" != "$(nvm version default)" ]; then' >> ~/.profile
  echo '    echo "Reverting to nvm default version"' >> ~/.profile
  echo '    nvm use default' >> ~/.profile
  echo '  fi' >> ~/.profile
  echo '}' >> ~/.profile
  echo 'add-zsh-hook chpwd load-nvmrc' >> ~/.profile
  echo 'load-nvmrc' >> ~/.profile

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
else
  echo "OK"
fi


# Install Node.js #############################################################

echo "***************************************************"
echo "Checking for Node.js... "
echo "***************************************************"
if ! node --version; then
  nvm install stable
  nvm alias default stable
  nvm use default
else
  echo 'OK'
fi


# Ruby and Version Manager ####################################################

echo "***************************************************"
echo 'Cheking for Ruby... '
echo "***************************************************"
if ! ruby -v; then
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  sudo apt-get install -y libxml2 libxml2-dev libxslt1-dev libpq-dev
  \curl -sSL https://get.rvm.io | bash
  source $HOME/.rvm/scripts/rvm
  rvm get head
  rvm install ruby-2.5.0
  rvm use ruby-2.5.0@global
  gem update --system --no-ri --no-rdoc
  gem update --no-ri --no-rdoc
  gem install bundler rails rspec-rails cucumber-rails pg redis-rails webpacker --no-ri --no-rdoc
  rvm use ruby-2.5.0 --default
  sudo apt-get autoremove
else
  echo 'OK'
fi


# Install Heroku CLI ##########################################################

echo "***************************************************"
echo "Checking Heroku CLI installation..."
echo "***************************************************"
if ! heroku --version; then
  wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
else
  echo 'OK'
fi


# Install Yarn package manager ################################################

echo "***************************************************"
echo "Checking Yarn installation..."
echo "***************************************************"
if ! dpkg -s yarn; then
 curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
 echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
 sudo apt-get update && sudo apt-get install -y yarn
fi


# Cleaning up #################################################################

echo "***************************************************"
echo 'Removing unused software... '
echo "***************************************************"
rvm cleanup all
sudo apt autoremove -y
