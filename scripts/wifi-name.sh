#!/bin/bash
name=`iwconfig wlp3s0 | grep ESSID | awk '{print $4}' | cut -c 7- | tr -d '"'`
echo $name
