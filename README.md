# CAEC
Reproducing the evaluation results of CAEC.

## Initializing associated repositories
Initializing repositories:
```
repo init -u https://github.com/comet-cc/CAEC.git -m manifest.xml
repo sync
```
The above commands initializes repositories required to build and reproduce CAEC evaluations. We used [OpenCCA](https://github.com/opencca) as the evaluation platform. The manifest clones OpenCCA repositories to build components and flash the board (Radxa Rock 5B), along with CAEC components provided in the following repositories:
| Repository | Description |
|-------------|--------------|
| [RMM-CAEC](https://github.com/comet-cc/RMM-CAEC) | CAEC's Realm Management Monitor (RMM) |
| [Guest-linux-patches](https://github.com/comet-cc/Linux-patches-CAEC/tree/master/guest-patches) | CAEC's host (hypervisor) linux patches |
| [Host-linux-patches](https://github.com/comet-cc/Linux-patches-CAEC/tree/master/host-patches) | CAEC's guest (realm) linux patches |
| [External-Modules-CAEC](https://github.com/comet-cc/External-Modules-CAEC) | External kernel modules supporting CAEC |
| [kvmtool-cca-CAEC](https://github.com/comet-cc/kvmtool-cca-CAEC) | Lightweight virtual machine manager for realm VMs |
| [debos-fs](https://github.com/comet-cc/debos-fs) | File system creator for realm VMs |
| [OpenCCA-patches](https://github.com/comet-cc/opencca-patches) | Patches of repositories cloned from OpenCCA |

## Building components
