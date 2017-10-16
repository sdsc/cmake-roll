#!/bin/sh
# Install additional system packages required for roll build.
yum clean all
yum --nogpgcheck -y install libmpc mpfr
