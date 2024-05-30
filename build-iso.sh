#!/bin/bash

cd /mnt/

sudo apt-get update && sudo apt-get install -y curl xorriso squashfs-tools syslinux syslinux-efi isolinux fakeroot dumpet gddrescue

if [ ! -f ubuntu-20.04.4-live-server-amd64.iso ];then
    curl -X GET -OL https://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-live-server-amd64.iso
fi

rm -rf iso
rm -rf filesystem.squashfs
rm -rf squashfs-root

xorriso -osirrox on -indev "ubuntu-20.04.4-live-server-amd64.iso" -extract / iso && chmod -R +w iso

cp iso/casper/filesystem.squashfs .

sudo unsquashfs filesystem.squashfs


sudo mount --bind /proc /squashfs-root/proc
sudo mount --bind /sys /squashfs-root/sys
sudo mount --bind /dev /squashfs-root/dev

sudo chroot squashfs-root/  << 'EOF'

mount none -t proc /proc; mount none -t sysfs /sys; mount none -t devpts /dev/pts

echo 'nameserver 8.8.8.8' > /etc/resolv.conf

cd /tmp

sudo apt-get update && sudo apt-get install -y wget git zip

rm -rf main.zip
rm -rf bpbx-scripts-main

wget https://github.com/byteee-com/bpbx-scripts/archive/refs/heads/main.zip

unzip main.zip  -d .

cd bpbx-scripts-main 

./install_bpbx.sh


 /bin/sh /usr/bin/mysqld_safe --user=mysql --datadir=/var/lib/mysql --socket=/var/run/mysqld/mysqld.sock
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /var/run/mysqld/


umount /proc
umount /sys

rm -rf /tmp/*

 echo ' ' > /etc/resolv.conf
 apt-get clean
 history -c
 exit
EOF

sudo mksquashfs  squashfs-root/ filesystem.squashfs -comp xz -b 1M -noappend

 sudo dd if=ubuntu-20.04.4-live-server-amd64.iso bs=512 count=1 of=iso/isolinux/isohdpfx.bin

cp filesystem.squashfs ./iso/casper/
 md5sum iso/.disk/info > iso/md5sum.txt
 sed -i 's|iso/|./|g' iso/md5sum.txt
 xorriso -as mkisofs -r -V "BPBX amd64" -o bpbx-1.0.1-amd64.iso -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus -isohybrid-mbr iso/isolinux/isohdpfx.bin iso/boot iso


 fdisk -lu bpbx-1.0.0-amd64.iso 
 dumpet -i bpbx-1.0.0-amd64.iso   
 xorriso -indev bpbx-1.0.0-amd64.iso  -toc -pvd_info