PACKAGECONFIG_append = " networkd resolved"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " file://eth.network \
             file://timesyncd.conf "


FILES_${PN} += "${sysconfdir}/systemd/network/eth.network"
FILES_${PN} += "${sysconfdir}/systemd/timesyncd.conf"

do_install_append() {
  if ${@bb.utils.contains('PACKAGECONFIG','networkd','true','false',d)}; then
        install -d ${D}${sysconfdir}/systemd/network
        install -m 0755 ${WORKDIR}/eth.network ${D}${sysconfdir}/systemd/network
  fi
  
  install -d ${D}${sysconfdir}/systemd
  install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd
}
