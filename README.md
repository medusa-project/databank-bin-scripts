Clone this into $HOME/bin, then link the $HOME/svc_hooks subdirectory to
$HOME/bin/svc_hooks.

Copy /etc/init.d/databank from this repository to /etc/init.d/databank on server, ensure executable

Everything that you might want to configure should be set in env.sh, which
the other scripts source. If something isn't, it should be.

See the crontab_demo_template and crontab_prod_template for schedules and scripts. Copy the appropriate text into the crontab on the respective servers.