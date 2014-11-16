#!/bin/bash

# Install Guest Additions.
yum -y install bzip2 gcc cpp kernel-devel kernel-headers perl make
mkdir /tmp/vbox
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/vbox
sh /tmp/vbox/VBoxLinuxAdditions.run
umount /tmp/vbox
rm -rf /tmp/vbox
rm /home/vagrant/*.iso
yum -y remove gcc cpp kernel-devel kernel-headers perl make

echo '! Guest Additions installed';
