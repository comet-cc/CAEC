# CAEC
Building components and reproducing the evaluation results of CAEC.

**Requirements**:
1) An x86 system to build components
2) Radxa Rock 5B (CAEC's evaluation board)
3) Micro SD card (larger than 8 GB) 

## Initializing the associated repositories
```
repo init -u https://github.com/comet-cc/CAEC.git -m manifest.xml
repo sync
```
The above commands initialize repositories required to build and reproduce CAEC evaluations. We used [OpenCCA](https://github.com/opencca) as the evaluation platform. The manifest clones OpenCCA repositories to build components and flash the board (Radxa Rock 5B), along with CAEC components provided in the following repositories:
| Repository | Description |
|-------------|--------------|
| [RMM-CAEC](https://github.com/comet-cc/RMM-CAEC) | CAEC's Realm Management Monitor (RMM) |
| [Guest-linux-patches](https://github.com/comet-cc/CAEC/tree/main/patches/guest-linux) | CAEC's guest (realm) Linux patches |
| [Host-linux-patches](https://github.com/comet-cc/CAEC/tree/main/patches/host-linux) | CAEC's host (hypervisor) Linux patches |
| [External-Modules-CAEC](https://github.com/comet-cc/External-Modules-CAEC) | External kernel modules supporting CAEC |
| [kvmtool-cca-CAEC](https://github.com/comet-cc/kvmtool-cca-CAEC) | Lightweight virtual machine manager for realm VMs |
| [debos-fs](https://github.com/comet-cc/debos-fs) | File system creator for realm VMs |
| [OpenCCA-patches](https://github.com/comet-cc/CAEC/tree/main/patches) | Patches of repositories cloned from OpenCCA |

## Building components
1) Run prebuild script (update submodules, apply patches, etc):
```
./CAEC-manifest/prebuild.sh
```

2) Build and start docker container (Make sure you have the requirements installed as described [here](https://github.com/SinaAb7/opencca-build)):
```
./CAEC-manifest/container.sh
```

3) Build components (edk2, CCA firmware, host and guest Linux, kvmtool, etc) inside the container:
```
./opencca-build/scripts/build_all.sh
```

4) Build the guest and host file systems with:
```
./CAEC-manifest/build_guest_fs.sh
./CAEC-manifest/build_host_fs.sh
```

5) SD card preparation: Attach the SD card to the x86 build system.  Find the device name under `/dev` using `lsblk` and run:
```
# Run outside of the container 
./debian-image-recipes/disk_create.sh [device_name]
```
Insert SD card to the board.
`Hint:` If the SD card is available at `/dev/sdb`, the device_name is equal to `sdb`. 

6) Flash the board:
Hold Maskrom key of the board, plug in the OTG port to the x86 build system, and run:
```
# Run outside of the container 
sudo ./opencca-flash/flash/flash.sh spi
```
The board is now ready. You can follow the guide [here](https://docs.radxa.com/en/rock5/rock5b/radxa-os/serial) to set up a console access to the board.

## Reproducing Benchmarks 

### Communication benchmark
1) Boot two realm VMs in two screen sessions:
```
screen -S master
./create_realm_VM
```
exit from the current session with `ctrl+a d` 
```
screen -S slave
./create_realm_VM
```
2) Run scripts with each session
```
./slave.sh
```
exit from the current session with `ctrl+a d` 
```
screen -r master
./master.sh
```
### Data sharing benchmark




## Paper
**CAEC: Confidential, Attestable, and Efficient Inter-CVM Communication with Arm CCA**,
Sina Abdollahi, Amir Al Sadi, Marios Kogias, David Kotz, Hamed Haddadi
**Conference**

**Abstract** -- 
The paper can be found [here](https://arxiv.org/pdf/2512.01594).

## Citation

If you use the code/data in your research, please cite our work as follows:
**google schoolar link**

## Contact
In case of questions, please get in touch with [Sina Abdollahi](https://www.imperial.ac.uk/people/s.abdollahi22).
