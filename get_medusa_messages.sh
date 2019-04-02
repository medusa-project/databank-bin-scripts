#!/usr/bin/env bash
#get_medusa_messages.sh
HOME=/home/databank
source $HOME/bin/env.sh
cd $HOME/current
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  rbenv local 2.5.1
fi
bundle exec rake medusa:get_medusa_ingest_responses > /dev/null 2>&1
