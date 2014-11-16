#!/bin/bash
yum -y clean all
rm -rf /tmp/*
find /var/log -type f | while read f; do echo -ne '' > $f; done;

echo '! Cleanup done';
