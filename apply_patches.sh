#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $DIR/../linux
git am ../CAEC-manifest/patches/host-linux/*.patch

cd $DIR/../linux-guest
git am ../CAEC-manifest/patches/guest-linux/*.patch

cd $DIR/../debian-image-recipes
git am ../CAEC-manifest/patches/debian-image-recipes/*.patch
