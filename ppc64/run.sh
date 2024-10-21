[ -e vmlinux.strip ] || gunzip -k vmlinux.strip
[ -e rootfs.cpio ] || gunzip -k rootfs.cpio

qemu-system-ppc64 -M mac99 -cpu ppc64 -m 1G \
    -kernel vmlinux.strip \
    -initrd rootfs.cpio \
    -device ne2k_pci,netdev=net0 -netdev user,id=net0 \
    -nographic -vga none -monitor null -no-reboot \
    --append "kunit.enable=0 rdinit=/sbin/init console=tty console=ttyS0"
