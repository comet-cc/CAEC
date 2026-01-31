#!/bin/bash
set -x
sudo nice -n -20 taskset -c 1 ./lkvm run --realm -c 1 -m 500 -k /home/user/VM_image/Image -i /home/user/VM_image/VM-fs.cpio \
--9p /home/user/shared_with_VM,sh --irqchip=gicv3-its --restricted_mem --loglevel=debug -r 500 
#--shmem 32M:file=/dev/shm/buf:mlock 
