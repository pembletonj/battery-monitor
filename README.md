# battery-monitor
A small bash script to monitor the battery and send a notification when certain conditions are met.

## Features
* Notify when battery level is below a certain point and discharging.
* Notify when battery level is above a certain point and charging.

## To Do
* Dynamically change how long to wait until battery is checked again based on how quickly it is charging/discharging.

## Installation
Run install.sh as root. It will copy battery-monitor.sh to /usr/local/bin/ and make it executable.

## Configuration
Settings can be changed by modifying the low_level, high_level, and sleep_time variables at the top of the script.
* low_level: Notifications will be sent if the battery level is below this and discharging.
* high_level: Notifications will be sent if the battery level is above this and charging.
* sleep_time: The interval between when the battery is checked.
