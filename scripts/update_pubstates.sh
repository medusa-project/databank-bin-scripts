#!/usr/bin/env bash
# update_pubstate.sh
HOME=/home/databank
source $HOME/bin/env.sh
cd $HOME/current
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
bundle exec rails pub:update_state >> /dev/null
bundle exec rails sunspot:reindex >> /dev/null
