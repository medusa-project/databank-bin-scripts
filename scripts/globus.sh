#!/usr/bin/env bash
# globus.sh
HOME=/home/databank
source $HOME/bin/scripts/env.sh
cd $HOME/current
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
bundle exec rails globus:copy_datasets >> /dev/null