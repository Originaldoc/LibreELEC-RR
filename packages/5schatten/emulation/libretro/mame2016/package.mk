# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="mame2016"
PKG_VERSION="efc37c9968fe24af8d91d9ce6022e080a1fd90c3"
PKG_SHA256="da9b5b86473d0abb846c12cc0bd127aca80e4ccbcaba1fa6493fc88a69521480"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2016-libretro"
PKG_URL="https://github.com/libretro/mame2016-libretro/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Late 2016 version of MAME (0.174) for libretro. Compatible with MAME 0.174 romsets."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto-parallel"

PKG_LIBNAME="mamearcade2016_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

make_target() {
  if [ "${ARCH}" = "arm" ]; then
    PKG_NOASM="1"
  else
    PKG_NOASM="0"
  fi

  if [ "${ARCH}" = "x86_64" ]; then
    PKG_PTR64="1"
  else
    PKG_PTR64="0"
  fi

  make REGENIE=1 VERBOSE=1 NOWERROR=1 PYTHON_EXECUTABLE=python2 CONFIG=libretro \
       LIBRETRO_OS="unix" ARCH="" PROJECT="" LIBRETRO_CPU="${ARCH}" DISTRO="debian-stable" \
       CROSS_BUILD="1" OVERRIDE_CC="${CC}" OVERRIDE_CXX="${CXX}" \
       PTR64="${PKG_PTR64}" NOASM="${PKG_NOASM}" TARGET="mame" \
       SUBTARGET="arcade" PLATFORM="${ARCH}" RETRO=1 OSD="retro" GIT_VERSION=${PKG_VERSION:0:7}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/mame2016_libretro.so
}
