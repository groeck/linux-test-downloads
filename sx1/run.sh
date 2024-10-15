QEMU="qemu-system-arm"
CONSOLE="console=ttyS0,115200 earlycon=uart8250,mmio32,0xfffb0000,115200n8"

${QEMU} -M sx1 -kernel zImage -no-reboot \
    -initrd rootfs-armv4.cpio \
    --append "kunit.enable=0 rdinit=/sbin/init ${CONSOLE}" \
    -nographic -monitor null -serial stdio

${QEMU} -M sx1 -kernel zImage -no-reboot -snapshot \
    -drive file=rootfs-armv4.ext2,format=raw,if=sd \
    --append "kunit.enable=0 root=/dev/mmcblk0 rootwait ${CONSOLE}" \
    -nographic -monitor null -serial stdio

${QEMU} -M sx1 -kernel zImage -no-reboot -snapshot \
    -drive file=flash,format=raw,if=pflash \
    --append "kunit.enable=0 root=/dev/mtdblock3 rootwait ${CONSOLE}" \
     -nographic -monitor null -serial stdio
