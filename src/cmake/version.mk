NAME	       = sdsc-cmake
VERSION	       = 3.0.2
RELEASE	       = 1
PKGROOT        = /opt/cmake

SRC_SUBDIR     = cmake

SOURCE_NAME    = cmake
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
