#!/bin/bash

# Change to modify behaviour
low_level="30"
high_level="80"
sleep_time="5m"



for (( ; ; ))
do

	charging_state=$(upower -i $(upower -e | grep BAT0) | grep -i "state" | awk 'NF {print $2}')
	current_level=$(upower -i $(upower -e | grep BAT0) | grep -i "percentage" | grep -o '[0-9]')

	# Some magic found here: https://unix.stackexchange.com/questions/57124/remove-newline-from-unix-variable
	# Removes newline character.
	current_level=${current_level//$'\n'/}

	if [ "$current_level" -le "$low_level" ] && [ "$charging_state" = "discharging" ]
	then
		notify-send "Battery Monitor" "Your battery is running low.\nBattery: $current_level"
	elif [ "$current_level" -ge "$high_level" ] && [ "$charging_state" = "charging" ]
	then
		notify-send "Battery Monitor" "Your battery is done charging.\nBattery: $current_level"
	fi

	sleep $sleep_time

done
