#!/usr/bin/env bash
#export4experts.sh
HOME=/home/databank
source $HOME/bin/env.sh
cd $HOME/current
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
bundle exec rails experts:generate_doc > /dev/null 2>&1
bundle exec rails experts:fetch_demo_doc > /dev/null 2>&1
