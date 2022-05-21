#!/bin/bash

# Does not use dependencies, but requires root. 
trap 'printf "\n";stop' 2
trap 'exit 130' INT

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

if [[ $EUID -ne 0 ]]; then
   echo -e "Run as root.";
   exit 1;
fi

# Find proper device. USB keyboard has two digits most of the time.
device=$(ls /sys/class/leds | grep '[0-9][0-9]::scrolllock')

# Read current state of brightness level.
lightState=$(cat /sys/class/leds/$device/brightness)

# Sets brightness accordingly.
if [ $lightState = "1" ]
then
  echo 0 > /sys/class/leds/$device/brightness
else
  echo 1 > /sys/class/leds/$device/brightness
fi