#!/usr/bin/env bash
#get_medusa_messages.sh
HOME=/home/databank
source $HOME/bin/scripts/env.sh
cd $HOME/current
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
bundle exec rails metrics:generate_docs > /dev/null 2>&1
