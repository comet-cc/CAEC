# CAEC
Reproducing the evaluation results of CAEC.

## Initializing the associated repositories
```
repo init -u https://github.com/comet-cc/CAEC.git -m manifest.xml
repo sync
```
The above commands initializes repositories required to build and reproduce CAEC evaluations. We used [OpenCCA](https://github.com/opencca) as the evaluation platform. The manifest clones OpenCCA repositories to build components and flash the board (Radxa Rock 5B), along with CAEC components provided in the following repositories:
| Repository | Description |
|-------------|--------------|
| [RMM-CAEC](https://github.com/comet-cc/RMM-CAEC) | CAEC's Realm Management Monitor (RMM) |
| [Guest-linux-patches](https://github.com/comet-cc/CAEC/tree/main/patches/guest-linux) | CAEC's guest (realm) linux patches |
| [Host-linux-patches](https://github.com/comet-cc/CAEC/tree/main/patches/host-linux) | CAEC's host (hypervisor) linux patches |
| [External-Modules-CAEC](https://github.com/comet-cc/External-Modules-CAEC) | External kernel modules supporting CAEC |
| [kvmtool-cca-CAEC](https://github.com/comet-cc/kvmtool-cca-CAEC) | Lightweight virtual machine manager for realm VMs |
| [debos-fs](https://github.com/comet-cc/debos-fs) | File system creator for realm VMs |
| [OpenCCA-patches](https://github.com/comet-cc/opencca-patches) | Patches of repositories cloned from OpenCCA |

## Building components
1) Run prebuild script (update submodules, apply patches, etc):
```
./CAEC-manifest/prebuild.sh
```

2) Build and start docker container with (Make sure you have the requirements installed as described [here](https://github.com/SinaAb7/opencca-build)):
```
./CAEC-manifest/container.sh
```

3) Build components (edk2, CCA firmware, host and guest linux, kvmtool, etc) inside the container:
```
./opencca-build/scripts/build_all.sh
```

4) Build the guest and host file systems with:


