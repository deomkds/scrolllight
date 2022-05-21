#!/bin/bash

# Requires http://haikarainen.github.io/light/

# Find proper device. USB keyboard has two digits that may change between reboots.
device=$(light -L | grep '[0-9][0-9]::scrolllock')

# Get only the device name.
substring=${device:17}

# Read current state of brightness level.
lightState=$(cat /sys/class/leds/input$substring/brightness)

# Sets brightness accordingly.
if [ $lightState = "1" ]
then
  light -Srs $device 0
else
  light -Srs $device 1
fi
