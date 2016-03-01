#!/bin/bash
ip=`ip route | grep wlp3s0 | cut -d ' ' -f 12`
echo $ip
