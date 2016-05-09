#!/bin/bash

echo "Checking for Git large File Storage"
git-lfs version > /dev/null
if [[ $? != 0 ]]; then
  echo "Git LFS not found."
  echo "Install it using your package manager or at https://git-lfs.github.com/."
  echo "Until this is done, /downloads will appear strangely."
fi

# remove cached node modules if they exist
if [ -d "node_modules" ]; then
  rm -rf node_modules
fi

# copy config template if it doesn't exist
if [ ! -f _config.yml ]; then
  cp _config.yml.template _config.yml
fi

# install remaining modules locally
echo "Installing node modules"
npm install -g grunt-cli bower
npm install

# install bundler gem
echo 'Checking for bundler gem'
if ! [ $(gem list bundler -i) ]; then
  gem install bundler && bundle install
fi

