#!/usr/bin/env bash
# handle_ripe_tasks.sh
HOME=/home/databank
source $HOME/bin/env.sh
cd $HOME/current
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
bundle exec rake databank_tasks:handle_ripe_tasks > /dev/null 2>&1
