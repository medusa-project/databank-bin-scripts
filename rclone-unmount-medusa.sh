#!/bin/bash

source $HOME/bin/env.sh

mountpoint -q $RCLONE_MEDUSA_MOUNTPOINT && fusermount -uz $RCLONE_MEDUSA_MOUNTPOINT
