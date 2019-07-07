# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Frank Hartung (supervisedthinking@gmail.com)

PKG_NAME="oem"
PKG_VERSION="1.0"
PKG_LICENSE="various"
PKG_SITE="http://www.libreelec.tv"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="oem"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"
PKG_TOOLCHAIN="manual"

################################################################################
# Setup common LibreELEC-RR packages included in all images
################################################################################

# Common applications
OEM_APPLICATIONS_COMMON=""

# Common standalone emulators
OEM_EMULATORS_COMMON=" \
  emulationstation \
  dosbox-sdl2 \
  hatari \
  moonlight-embedded \
  ppsspp"

# Extra frontends
OEM_FRONTENDS_EXTRA_COMMON=" \
  pegasus-frontend"

# Common libretro cores
OEM_LIBRETRO_COMMON=" \
  retroarch \
  2048-lr \
  atari800-lr \
  beetle-pce-fast-lr \
  beetle-wswan-lr \
  bluemsx-lr \
  chailove-lr \
  desmume-lr \
  dosbox-lr \
  fbneo-lr \
  fceumm-lr \
  flycast-lr \
  fuse-lr \
  gambatte-lr \
  genesis-plus-gx-lr \
  mame2003-plus-lr \
  mgba-lr \
  mrboom-lr \
  mupen64plus-lr \
  mupen64plus-nx-lr \
  nestopia-lr \
  pcsx_rearmed-lr \
  prboom-lr \
  scummvm-lr \
  snes9x-lr \
  stella2014-lr \
  tyrquake-lr"

# Common tools
OEM_TOOLS_COMMON=" \
  ds4drv \
  htop \
  lm-sensors \
  midnight-commander \
  rr-config-tool \
  sdl-jstest \
  Skyscraper \
  spectre-meltdown-checker \
  strace-system"

################################################################################
# Setup packages included in Amlogic images
################################################################################

# Applications
OEM_APPLICATIONS_AMLOGIC=""

# Standalone emulators
OEM_EMULATORS_AMLOGIC=" \
  amiberry"

# Frontends
OEM_FRONTENDS_EXTRA_AMLOGIC=""

# Libretro cores 
OEM_LIBRETRO_AMLOGIC=" \
  snes9x2010-lr \
  vice-lr \
  yabause-lr"

# Libretro cores for AMLG12 devices
OEM_LIBRETRO_AMLG12=" \
  mame2016-lr \
  mesen-lr \
  yabasanshiro-lr"

# Libretro cores for AMLGXL devices
OEM_LIBRETRO_AMLGXL=" \
  mame2010-lr"

# Tools
OEM_TOOLS_AMLOGIC=""

################################################################################
# Setup packages included in Generic images
################################################################################

# Applications
OEM_APPLICATIONS_GENERIC=" \
  google-chrome \
  moonlight-qt \
  spotify"

# Standalone emulators
OEM_EMULATORS_GENERIC=" \
  citra \
  dolphin \
  fs-uae \
  mupen64plus \
  PCSX2 \
  vice \
  yquake2"

# Frontends
OEM_FRONTENDS_EXTRA_GENERIC=""

# Libretro cores
OEM_LIBRETRO_GENERIC=" \
  beetle-psx-lr \
  beetle-saturn-lr \
  bsnes-mercury-accuracy-lr \
  bsnes-mercury-balanced-lr \
  citra-lr \
  dolphin-lr \
  kronos-lr \
  mame2016-lr \
  mesen-lr \
  nSide-lr \
  parallel-n64-lr \
  ppsspp-lr \
  yabasanshiro-lr"

# Tools
OEM_TOOLS_GENERIC=" \
  dmidecode \
  mesa-demos-system \
  smartmontools \
  tigervnc-system \
  vulkan-tools"

################################################################################
# Setup packages included in Rockchip images
################################################################################

# Applications
OEM_APPLICATIONS_ROCKCHIP=""

# Frontends
OEM_FRONTENDS_EXTRA_ROCKCHIP=""

# Standalone emulators
OEM_EMULATORS_ROCKCHIP=" \
  amiberry"

# Libretro cores 
OEM_LIBRETRO_ROCKCHIP=" \
  snes9x2010-lr \
  vice-lr \
  yabause-lr"

# Libretro cores for RK3399 devices
OEM_LIBRETRO_RK3399=" \
  mame2016-lr \
  mesen-lr \
  yabasanshiro-lr"

# Tools
OEM_TOOLS_ROCKCHIP=""

################################################################################
# Setup packages included in Raspberry Pie images
################################################################################

# Applications
OEM_APPLICATIONS_RPI=""

# Frontends
OEM_FRONTENDS_EXTRA_RPI=""

# Libretro cores
OEM_LIBRETRO_RPI=" \
  mame2010-lr \
  snes9x2010-lr \
  vice-lr \
  yabause-lr"

# Standalone emulators
OEM_EMULATORS_RPI=" \
  amiberry"

# Tools
OEM_TOOLS_RPI=""

################################################################################
# Install OEM packages to LibreELEC-RR
################################################################################

configure_package() {
  if [ "${OEM_SUPPORT}" = "yes" ]; then

    # Add application packages
    if [ "${OEM_APPLICATIONS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_APPLICATIONS_COMMON}"
      case ${PROJECT} in
        Amlogic)
          PKG_DEPENDS_TARGET+=" ${OEM_APPLICATIONS_AMLOGIC}"
          ;;
        Generic)
          PKG_DEPENDS_TARGET+=" ${OEM_APPLICATIONS_GENERIC}"
          ;;
        Rockchip)
          PKG_DEPENDS_TARGET+=" ${OEM_APPLICATIONS_ROCKCHIP}"
          ;;
        RPi)
          PKG_DEPENDS_TARGET+=" ${OEM_APPLICATIONS_RPI}"
          ;;
      esac
    fi

    # Add Emulationstation frontend & standalone emulator packages
    if [ "${OEM_EMULATORS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_COMMON}"
      case ${PROJECT} in
        Amlogic)
          PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_AMLOGIC}"
          ;;
        Generic)
          PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_GENERIC}"
          ;;
        Rockchip)
          PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_ROCKCHIP}"
          ;;
        RPi)
          PKG_DEPENDS_TARGET+=" ${OEM_EMULATORS_RPI}"
          ;;
      esac
    fi

    # Add additional frontend packages
    if [ "${OEM_FRONTENDS_EXTRA}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_FRONTENDS_EXTRA_COMMON}"
      case ${PROJECT} in
        Amlogic)
          PKG_DEPENDS_TARGET+=" ${OEM_FRONTENDS_EXTRA_AMLOGIC}"
          ;;
        Generic)
          PKG_DEPENDS_TARGET+=" ${OEM_FRONTENDS_EXTRA_GENERIC}"
          ;;
        Rockchip)
          PKG_DEPENDS_TARGET+=" ${OEM_FRONTENDS_EXTRA_ROCKCHIP}"
          ;;
        RPi)
          PKG_DEPENDS_TARGET+=" ${OEM_FRONTENDS_EXTRA_RPI}"
          ;;
      esac
    fi

    # Add Retroarch frontend & libretro core packages 
    if [ "${OEM_LIBRETRO}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_LIBRETRO_COMMON}"
      case ${PROJECT} in
        Amlogic)
          PKG_DEPENDS_TARGET+=" ${OEM_LIBRETRO_AMLOGIC}"
          case ${DEVICE} in
            AMLG12)
              PKG_DEPENDS_TARGET+=" ${OEM_LIBRETRO_AMLG12}"
            ;;
            AMLGXL)
              PKG_DEPENDS_TARGET+=" ${OEM_LIBRETRO_AMLGXL}"
            ;;
           esac
          ;;
        Generic)
          PKG_DEPENDS_TARGET+=" ${OEM_LIBRETRO_GENERIC}"
          ;;
        Rockchip)
          PKG_DEPENDS_TARGET+=" ${OEM_LIBRETRO_ROCKCHIP}"
          case ${DEVICE} in
           RK3399)
             PKG_DEPENDS_TARGET+=" ${OEM_LIBRETRO_RK3399}"
           ;;
          esac
          ;;
        RPi)
          PKG_DEPENDS_TARGET+=" ${OEM_LIBRETRO_RPI}"
          ;;
      esac
    fi

    # Add tool packages
    if [ "${OEM_TOOLS}" = "yes" ]; then
      PKG_DEPENDS_TARGET+=" ${OEM_TOOLS_COMMON}"
      case ${PROJECT} in
        Amlogic)
          PKG_DEPENDS_TARGET+=" ${OEM_TOOLS_AMLOGIC}"
          ;;
        Generic)
          PKG_DEPENDS_TARGET+=" ${OEM_TOOLS_GENERIC}"
          ;;
        Rockchip)
          PKG_DEPENDS_TARGET+=" ${OEM_TOOLS_ROCKCHIP}"
          ;;
        RPi)
          PKG_DEPENDS_TARGET+=" ${OEM_TOOLS_RPI}"
          ;;
      esac
    fi
  fi
}

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}

  # Install OEM config files & scripts
  cp -PRv ${PKG_DIR}/files/common/*     ${INSTALL}
  cp -PRv ${PKG_DIR}/files/${PROJECT}/* ${INSTALL}
}
