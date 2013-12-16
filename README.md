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

None


## Building

To build the cmake-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `cmake-roll-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks enable roll cmake
% cd /export/rocks/install
% rocks create distro
% rocks run roll cmake | bash
```

In addition to the software itself, the roll installs cmake environment module
files in:

```shell
/opt/modulefiles/applications/cmake
```

## Testing

The cmake-roll includes a test script which can be run to verify proper
installation of the cmake-roll documentation, binaries and module files. To run
the test scripts execute the following command(s):

```shell
% /root/rolltests/cmake.t 
ok 1 # skip not server
ok 2 - cmake is installed
ok 3 - Simple cmake run
ok 4 - cmake module installed
ok 5 - cmake version module installed
ok 6 - cmake version module link created
1..6
```
