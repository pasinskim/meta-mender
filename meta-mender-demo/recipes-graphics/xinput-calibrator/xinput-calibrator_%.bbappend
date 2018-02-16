SUMMARY = "Touchscreen calibration program for X11"
HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"

# We don't want the touchscreen calibration tool to be launched after 
# each device boot.
do_post_install() {
   rm -f ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
   rm -f ${D}${sysconfdir}/X11/Xsession.d/30xinput_calibrate.sh
}

addtask do_post_install after do_install before do_package
