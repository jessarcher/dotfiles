#!/usr/bin/env sh

sudo dnf install gphoto2 ffmpeg-free v4l-utils kernel-devel kernel-headers

git clone git@github.com:umlaeute/v4l2loopback.git /tmp/v4l2loopback --depth=1
cd /tmp/v4l2loopback

make clean
make && sudo make install
sudo depmod -a
rm -rf /tmp/v4l2loopback

sudo echo 'options v4l2loopback devices=1 card_label="V4L2 Webcam" exclusive_caps=1' > /etc/modprobe.d/v4l2loopback.conf

sudo modprobe v4l2loopback
