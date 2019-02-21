#!/usr/bin/env bash

#This is to set up the things the local user can install, like
#source package, rbenv, the fixity/fits servers, etc.
[[ -d $HOME/.bashrc ]] && source $HOME/.bashrc
source $HOME/bin/env.sh

function die {
    echo $1
    exit 1
}

##Set up rbenv
if [[ ! -d ~/.rbenv ]]; then
    echo "Setting up rbenv"
    #get rbenv with plugins
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    cd ~/.rbenv && src/configure && make -C src
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    export PATH="$HOME/.rbenv/bin:$PATH"
    ~/.rbenv/bin/rbenv init
    mkdir -p "$(rbenv root)"/plugins
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
    git clone https://github.com/rkh/rbenv-update.git "$(rbenv root)/plugins/rbenv-update"
    git clone https://github.com/rbenv/rbenv-vars.git "$(rbenv root)/plugins/rbenv-vars"
    git clone https://github.com/rbenv/rbenv-default-gems.git "$(rbenv root)/plugins/rbenv-default-gems"
    if [ ! -f $(rbenv root)/default-gems ]; then
	echo "bundler ~>1.16" > $(rbenv root)/default-gems
    fi
else
    echo "Updating rbenv"
    rbenv update
fi

#Install rubies. Install gems as appropriate.
DATABANK_RUBY_VERSION=$(cat $DATABANK_TEMP_CHECKOUT_DIR/.ruby-version)
eval "$(rbenv init -)"
echo "Installing databank ruby"
rbenv install -s $DATABNK_RUBY_VERSION

echo "Making databank ruby the default rbenv ruby"
rbenv global $DATABANK_RUBY_VERSION
rbenv shell $DATABANK_RUBY_VERSION

mkdir -p $HOME/etc
cp logrotate.conf $HOME/etc/logrotate.conf
echo "Installed logrotate.conf"
crontab crontab
echo "Installed crontab"

echo "Linking databank to capistrano current - note the latter may not exist yet"
ln -nsf $CAPISTRANO_DIR/current $DATABANK_DIR

echo "Linking svc_hooks directory"
ln -nsf $HOME/bin/svc_hooks $HOME/svc_hooks