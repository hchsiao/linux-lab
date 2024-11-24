#!/bin/bash

mkdir -p build
cd build

rm -rf initramfs
mkdir initramfs

mkdir -p initramfs/dev
cp -a busybox-1.36.1/o/rootfs/bin initramfs/bin
cp -a busybox-1.36.1/o/rootfs/sbin initramfs/sbin
cp -a busybox-1.36.1/o/rootfs/usr initramfs/usr
cp -a busybox-1.36.1/o/rootfs/linuxrc initramfs/linuxrc

cat <<EOF > initramfs/init
#!/bin/sh
echo "### INIT SCRIPT ###"
mkdir /proc /sys /tmp
mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /tmp
echo -e "\nThis boot took $(cut -d' ' -f1 /proc/uptime) seconds\n"
exec /bin/sh
EOF
chmod +x initramfs/init

pushd initramfs
find -print0 | cpio -0oH newc > ../initramfs.cpio
popd
