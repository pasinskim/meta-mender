DESCRIPTION = "X autostart script to run file for demo purposes."
HOMEPAGE = "https://mender.io"
LICENSE = "Apache-2.0"


# depends on virtual/libx11
REQUIRED_DISTRO_FEATURES = "x11"
DEPENDS = "virtual/libx11 libxi libxrandr"

SRC_URI = " \
	file://${PN}.desktop \
	file://mender-locked.mp4 \
	file://mender-unlocked.mp4 \
	file://LICENSE \
"

LIC_FILES_CHKSUM = "file://${S}/../LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"

do_install() {
  install -d ${D}/${sysconfdir}
  install -m 0644 ${WORKDIR}/mender-locked.mp4 ${D}/${sysconfdir}
  install -m 0644 ${WORKDIR}/mender-unlocked.mp4 ${D}/${sysconfdir}
  install -d ${D}${sysconfdir}/xdg/autostart
  install -m 0644 ${WORKDIR}/${PN}.desktop ${D}${sysconfdir}/xdg/autostart
}

FILES_${PN} += "${sysconfdir}/xdg/autostart"
RDEPENDS_${PN} = "xinput formfactor ffmpeg"

