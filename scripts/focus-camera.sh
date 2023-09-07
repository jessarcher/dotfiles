#/usr/bin/env sh

NOTIFICATION_ID=$(notify-send --transient --print-id --expire-time=5000 --icon camera-video "Focus" "Camera focusing...")

gphoto2 --set-config /main/capturesettings/focusmode=1 \
    && sleep 2 \
    && gphoto2 --set-config /main/capturesettings/focusmode=0

if [ $? -eq 0 ]; then
    notify-send --transient --replace-id=$NOTIFICATION_ID --icon camera-video "Focus" "Camera focused."
    exit 0
else
    notify-send --transient --replace-id=$NOTIFICATION_ID --icon dialog-error "Focus" "Camera failed to focus."
    exit 1
fi
