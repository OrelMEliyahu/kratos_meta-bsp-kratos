DESCRIPTION = "Bit service"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=6f2e58f9db926d1d557f69da36ac4b7c"

SRC_URI = "file://bit.c \
           file://bit.service"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_SERVICE:${PN} = "bit.service"

do_compile() {
    ${CC} ${CFLAGS} ${LDFLAGS} -o bit bit.c
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 bit ${D}${bindir}

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/bit.service ${D}${systemd_system_unitdir}/
}

FILES:${PN} += "${systemd_system_unitdir}/bit.service"
