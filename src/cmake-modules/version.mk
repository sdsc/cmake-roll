# Get the cmake version from its version.mk file. See Makefile
VERSION.MK.MASTER = version.mk
VERSION.MK.MASTER.DIR = ../cmake
VERSION.MK.INCLUDE = cmake.version.mk
include $(VERSION.MK.INCLUDE)

NAME	= cmake-modules
VERSION	= 3.0.0
RELEASE	= 0

RPM.EXTRAS         = AutoReq:No
