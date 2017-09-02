#!/usr/bin/env zsh

# Install Node Version Manager ################################################

echo "***************************************************"
echo "Checking for NVM... "
echo "***************************************************"
if [[ ! -x "$HOME/.nvm" ]]; then
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

  echo '# Node Version Manager'  >> ~/.profile
  echo 'export NVM_DIR="$HOME/.nvm"'  >> ~/.profile
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'  >> ~/.profile
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'  >> ~/.profile

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
  nvm install 8.2
  nvm use 8.2
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
  source /home/ubuntu/.rvm/scripts/rvm
  rvm get head
  rvm install ruby-2.4.1
  rvm use ruby-2.4.1@global
  gem update --system
  gem update
  gem install bundler rails rspec-rails cucumber-rails pg redis-rails
  rvm use ruby-2.4.1 --default
  sudo apt-get autoremove
else
  echo 'OK'
fi


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
fi

echo "***************************************************"
echo "             Starting Postgres server              "
echo "***************************************************"
sudo service postgresql start
echo "Postgres user: vagrant; Password: vagrant"


# Install Redis ###############################################################

echo "***************************************************"
echo "Checking Redis installation..."
echo "***************************************************"
if ! dpkg -s redis-server; then
  echo "Instalating Redis"
  sudo apt-get install -y redis-server
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
 sudo apt-get update && sudo apt-get install yarn
fi
