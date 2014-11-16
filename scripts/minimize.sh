#!/bin/bash

# Swap is disabled till reboot 
readonly swapuuid=$(/sbin/blkid -o value -l -s UUID -t TYPE=swap)
readonly swappart=$(readlink -f /dev/disk/by-uuid/"$swapuuid")
/sbin/swapoff "$swappart"
dd if=/dev/zero of="$swappart" bs=1M || echo "dd exit code $? is suppressed" 
/sbin/mkswap -U "$swapuuid" "$swappart"

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync

echo '! Image minimized';
