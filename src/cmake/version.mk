NAME	          = cmake
VERSION	          = 2.8.12.2
RELEASE	          = 0
PKGROOT          = /opt/cmake

SRC_SUBDIR        = cmake

CMAKE_NAME        = $(NAME)
CMAKE_VERSION     = $(VERSION)
CMAKE_PKG_SUFFIX  = tar.gz
CMAKE_SOURCE_PKG  = $(CMAKE_NAME)-$(CMAKE_VERSION).$(CMAKE_PKG_SUFFIX)
CMAKE_SOURCE_DIR  = $(CMAKE_SOURCE_PKG:%.$(CMAKE_PKG_SUFFIX)=%)

TAR_GZ_PKGS     = $(CMAKE_SOURCE_PKG)

RPM.EXTRAS         = AutoReq:No
