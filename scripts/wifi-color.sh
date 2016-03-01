#!/bin/bash

quality="$($HOME/scripts/wifi-quality.sh)"

if [[ $quality -ge 80 ]]; then
    echo "#00FF00"
elif [[ $quality -lt 80 ]]; then
    echo "#FFF600"
elif [[ $quality -lt 60 ]]; then
    echo "#FFAE00"
elif [[ $quality -lt 40 ]]; then
    echo "#FF0000"
fi
