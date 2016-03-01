#!/bin/bash
if=`ip route | grep default | cut -d ' ' -f 5`
echo $if
