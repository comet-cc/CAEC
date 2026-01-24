#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Apply patches to the relevant repositories
cd $DIR/../linux
git am ../CAEC-manifest/patches/host-linux/*.patch

cd $DIR/../linux-guest
git am ../CAEC-manifest/patches/guest-linux/*.patch

cd $DIR/../debian-image-recipes
git am ../CAEC-manifest/patches/debian-image-recipes/*.patch

# Update submodules 
cd $DIR/../tf-rmm
git submodule update --init --recursive

mkdir -p $DIR/../snapshot
mkdir -p $DIR/../debos-fs/ovelay
