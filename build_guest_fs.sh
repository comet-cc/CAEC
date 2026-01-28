#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )
OVERLAY="$DIR/debos-fs/overlay"
rsync -av --delete $DIR/External_modules/*.ko $OVERLAY/.
rsync -av --delete $DIR/External_modules/user-space/out/* $OVERLAY/.
rsync -av --delete $DIR/CAEC-manifest/overlays/guestfs/* $OVERLAY/.
#rsync -av --delete /home/netsys1/Multi-Realm-LLM-source/Multi-Realm-LLM/suplementary-binaries/out/* $OVERLAY/.

sudo $DIR/debos-fs/build.sh --tarname VM-fs.tar.gz
sudo $DIR/debos-fs/build.sh --imgsize 600MB --format ext4 --imgname VM-fs.img
