#!/bin/bash
# Add noreboot to command line to avoid autoreboot.
# Note that qemu does not exit qemu after a reboot command and has to be
# stopped manually.

qemu-system-arm -M collie \
    -kernel zImage -no-reboot \
    -initrd rootfs-sa110.cpio \
    --append "rdinit=/sbin/init console=ttySA1" \
    -nographic -monitor null -serial stdio
