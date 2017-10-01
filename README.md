# SDSC "cmake" roll

## Overview

This roll bundles the Cmake build tool.

For more information about the various packages included in the cmake roll
please visit their official web pages:

- <a href="http://www.cmake.org" target="_blank">CMake</a> is a cross-platform,
open-source build system.



## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate cmake source file(s) using a machine that does have
Internet access and copy them into the `src/cmake` directories on your Rocks
development machine.


## Dependencies

yum install libmpc mpfr

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.


## Building

To build the cmake-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% ./bootstrap.sh
% make 2>&1 | tee build.log
```

A successful build will create the file `cmake-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll cmake
% cd /export/rocks/install
% rocks create distro
% rocks run roll cmake | bash
```

In addition to the software itself, the roll installs cmake environment module
files in:

```shell
/opt/modulefiles/compilers/cmake
```

## Testing

The cmake-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To run
the test scripts execute the following command(s):

```shell
% /root/rolltests/cmake.t 
```
