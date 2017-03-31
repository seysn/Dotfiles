#!/bin/bash

WIFI_NAME=$(iwconfig wlp3s0 | grep ESSID | awk '{print $4}' | cut -c 7- | tr -d '"')
WIFI_IF=$(ip route | grep default | cut -d ' ' -f 5)
WIFI_QUALITY=$(grep $WIFI_IF /proc/net/wireless | tr -s ' ' | cut -d ' ' -f 3 | tr -d '.')
WIFI_IP=$(ip -o -4 addr list wlp3s0 | awk '{print $4}' | cut -d/ -f1)

if [ $WIFI_NAME = "off/any" ]; then
    echo "wifi off"
    echo "wifi off"
    echo "#FFFFFF"
else
    if [ -z $WIFI_QUALITY ]; then
        echo "Connecting"
        echo "Connecting"
        echo "#009900"
    else
        OUTPUT="($WIFI_QUALITY% at $WIFI_NAME) $WIFI_IP"
        echo $OUTPUT
        echo $OUTPUT
        echo "#00FF00"
    fi
fi
