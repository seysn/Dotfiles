#!/bin/bash

if [ -n "$1" ] ; then
    amixer -q -D pulse sset Master $1
    pkill -RTMIN+10 i3blocks
fi
