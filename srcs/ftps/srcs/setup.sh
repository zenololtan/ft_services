#!/bin/sh

adduser -D -h /var/ftp $USER
echo "$USER:$PASS" | chpasswd
vsftpd /etc/vsftpd/vsftpd.conf