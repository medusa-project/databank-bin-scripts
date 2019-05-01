#!/usr/bin/env bash
# update_pubstate.sh
HOME=/home/databank
source $HOME/shared/scripts/env.sh
cd $HOME/current
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
bundle exec rake pub:update_state >> /dev/null
bundle exec rake sunspot:reindex >> /dev/null
