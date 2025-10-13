# CAEC
Reproducing the evaluation results of CAEC.

## Initializing associated repositories
Initializing repositories:
```
repo init -u https://github.com/comet-cc/CAEC.git -m manifest.xml
repo sync
```
The above commands initializes repositories required to build software and firmware components of CAEC. Our build and boot flow is adapted from [OpenCCA](https://github.com/opencca), which is an open framework to enable Arm CCA research.
Here is a brief description of every repository.
 
CAEC-specific repositories:
| Repository | Description |
|-------------|--------------|
| [External-Modules-CAEC](https://github.com/comet-cc/External-Modules-CAEC) | External kernel modules supporting CAEC. |
| [kvmtool-cca-CAEC](https://github.com/comet-cc/kvmtool-cca-CAEC) | Lightweight virtual machine manager for realm VMs |
| [debos-fs](https://github.com/comet-cc/debos-fs) | File system creator for realm VMs |

CAEC-modified repositories initially forked from OpenCCA:
| Repository | Description |
|-------------|--------------|
| [RMM-CAEC](https://github.com/comet-cc/RMM-CAEC) | CAEC's Realm Management Monitor (RMM) |
| [Guest-linux-patches](https://github.com/comet-cc/Linux-patches-CAEC/tree/master/guest-patches) | CAEC's host (hypervisor) linux patches |
| [Host-linux-patches](https://github.com/comet-cc/Linux-patches-CAEC/tree/master/host-patches) | CAEC's guest (realm) linux patches |
| [opencca-build](https://github.com/comet-cc/opencca-build) | A Modified version of opencca build scripts |

Unmodified OpenCCA repositories:
| Repository | Description |
|-------------|--------------|

## Building components
