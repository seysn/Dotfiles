#!/bin/bash

if [ "$($HOME/scripts/wifi-name.sh)" = "off/any" ]; then
    echo "wifi off"
    echo "wifi off"
    echo "#FFFFFF"
else 
    OUTPUT="($($HOME/scripts/wifi-quality.sh)% at $($HOME/scripts/wifi-name.sh)) $($HOME/scripts/wifi-ip.sh)"
    echo $OUTPUT
    echo $OUTPUT
    echo $($HOME/scripts/wifi-color.sh)
fi
