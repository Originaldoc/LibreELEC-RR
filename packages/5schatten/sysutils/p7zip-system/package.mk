# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="p7zip-system"
PKG_VERSION="16.02"
PKG_SHA256="5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f"
PKG_LICENSE="GPL"
PKG_SITE="http://p7zip.sourceforge.net/"
PKG_URL="http://downloads.sourceforge.net/project/p7zip/p7zip/${PKG_VERSION}/p7zip_${PKG_VERSION}_src_all.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="p7zip is a port of 7za.exe for POSIX systems like Unix."
PKG_TOOLCHAIN="manual"

make_target() {
  make CXX=$CXX CC=$CC 7za
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp bin/7za $INSTALL/usr/bin
}
