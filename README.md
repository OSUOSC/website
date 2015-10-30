# The Open Source Club at The Ohio State University Website

[![Build Status](https://travis-ci.org/OSUOSC/open-source-club-website.svg?branch=master)](https://travis-ci.org/OSUOSC/open-source-club-website)

~~**Live Demo**: http://osc.eligladman.com/~~

## Prerequisites

#### Clone the Repo

```bash
git clone https://github.com/OSUOSC/open-source-club-website.git

cd open-source-club-website
```

#### install rvm (*ruby version manager*)

#####  OSX
  You'll need to install Ruby 2.2.2, and the easiest way to do this is with
  [rvm](https://rvm.io/), the Ruby Version Manager.

  Assuming you have Homebrew installed:
  ```bash
  brew install gpg
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
  source ~/.profile
  rvm install 2.2.2 && rvm use 2.2.2 --default
  ```
----

##### Linux
  download and run the install script

  *DO NOT run as root*
  ```bash
  curl -L get.rvm.io | sudo bash -s stable
  ```
  add user: `brutus` to the `rvm` group
  *replace `brutus` with your username*
  ```bash
  usermod -a -G rvm brutus
  ```

  reload terminal
  ```bash
  source ~/.bash_login
  ```

  install ruby version 2.2.2 and set it as the default
  ```bash
  rvm install 2.2.2 && rvm use 2.2.2 --default
  ```
  ----

- Windows

  TODO



#### install nvm (*node version manager*)
```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
nvm install 0.12.7 && nvm use 0.12.7
npm install
```
----

#### install assets
```bash
bower install
```
----

#### install gem dependencies
```bash
gem install bundler && bundle install
```

### install the grunt command line tool
```bash
sudo npm install grunt -g
```

##Development

#### start server
```bash
grunt serve
```

Once generated (which takes upwards of 5-10 minutes) the site will be accessible at `http://localhost:4040`
