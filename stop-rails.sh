#!/bin/bash --login

source $HOME/bin/env.sh

# Stop Passenger
( cd $DATABANK_HOME ; RAILS_ENV=$RAILS_ENV bundle exec passenger stop )

# Stop Delayed Job
( cd $DATANK_HOME ; RAILS_ENV=$RAILS_ENV bin/delayed_job -n 10 stop )

echo "Stopped Illinois Data Bank"

exit 0
