Clone this into $HOME/bin, then link the $HOME/svc_hooks subdirectory to
$HOME/bin/svc_hooks.

Everything that you might want to configure should be set in env.sh, which
the other scripts source. If something isn't, it should be.

The scripts to be called by cron in this repo are:
<br>get_medusa_messages.sh
<br>handle_ripe_tasks.sh
<br>notify.sh
<br>scrub_download_records.sh
<br>update_pubstates.sh
