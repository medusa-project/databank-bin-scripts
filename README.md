Clone this into $HOME/bin, then link the $HOME/svc_hooks subdirectory to
$HOME/bin/svc_hooks.

Everything that you might want to configure should be set in env.sh, which
the other scripts source. If something isn't, it should be.

The scripts to be called by cron in this repo are:
get_medusa_messages.sh
handle_ripe_tasks.sh
notify.sh
scrub_download_records.sh
update_pubstates.sh
