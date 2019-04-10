#!/usr/bin/env bash
#databank-bin-scripts/start-rails

source $HOME/bin/env.sh

#Clear Rails cache
( cd $DATABANK_HOME ; bundle exec rake databank:rails_cache:clear )

# Start Passenger
( cd $DATABANK_HOME ; bundle install ; bundle exec passenger start -e $RAILS_ENV -d --max-pool-size 20 )