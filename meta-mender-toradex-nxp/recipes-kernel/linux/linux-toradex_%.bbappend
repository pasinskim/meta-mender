FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_colibri-imx7 = " file://0001-Enable-capacitive-touch-display-on-Colibri-iMX7-boar.patch \
                                file://0002-Use-7-capacitive-display-by-default.patch \
                               "


