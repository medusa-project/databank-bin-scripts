#!/bin/bash

source $HOME/bin/env.sh

mountpoint -q $RCLONE_DATABANK_MOUNTPOINT && fusermount -uz $RCLONE_DATABANK_MOUNTPOINT
