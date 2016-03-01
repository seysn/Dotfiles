#!/bin/bash

[[ "$($HOME/scripts/wifi-name.sh)" = 'off/any' ]] && exit

interface="$($HOME/scripts/wifi-if.sh)"
quality=$(grep $interface /proc/net/wireless | tr -s ' ' | cut -d ' ' -f 3 | tr -d '.')

echo $quality
