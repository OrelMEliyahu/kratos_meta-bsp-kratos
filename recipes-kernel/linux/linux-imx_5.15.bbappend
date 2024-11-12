SRCBRANCH = "lf-5.15.y"
KERNEL_SRC ?= "git://github.com/nxp-imx/linux-imx.git;protocol=https;branch=${SRCBRANCH}"

SRC_URI += "file://0001-removed-promisc-check-on-eth1.patch \
            file://0002-named-gpio.patch \
            file://0003-embedded-definitions.patch \
            file://0004-whitelist-usb-support.patch \
            file://0005-usb-whitelist-add-lan-7800-and-7801.patch \
            file://0006-changed-UART-pins-for-UART0.patch \
            file://0007-add-uart-4.patch \
            file://0008-Load-FPGA-gpio-config.patch \
            file://0009-gpio-interrupt-kernel-dts-update.patch \
            file://0010-add-GPT.patch \
            file://defconfig.cfg"

do_configure:append() {
    cat ${WORKDIR}/defconfig.cfg >> ${B}/.config
}
