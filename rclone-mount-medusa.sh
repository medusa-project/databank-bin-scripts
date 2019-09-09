#!/bin/bash

source $HOME/bin/env.sh

mkdir -p $RCLONE_MEDUSA_MOUNTPOINT
mkdir -p $RCLONE_PIDDIR

#mountpoint -q $RCLONE_MOUNTPOINT && fusermount -uz $RCLONE_MOUNTPOINT
fusermount -uz $RCLONE_MEDUSA_MOUNTPOINT || echo "$RCLONE_MEDUSA_MOUNTPOINT may not be mounted currently"
rclone mount $RCLONE_REMOTE:$RCLONE_MEDUSA_BUCKET $RCLONE_MEDUSA_MOUNTPOINT --read-only &
echo $! > $RCLONE_MEDUSA_PIDFILE
