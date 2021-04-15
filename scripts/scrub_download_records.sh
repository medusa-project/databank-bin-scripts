#!/usr/bin/env bash
# scrub_download_records.sh
HOME=/home/databank
source $HOME/bin/scripts/env.sh
cd $HOME/current
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
bundle exec rails databank:scrub_download_records >> /dev/null
