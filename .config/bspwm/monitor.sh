#!/bin/bash

# this script setups the monitors workspaces, setup
# correctly the environment variables to correct working

# env variables
# get with xrandr
EXTERNAL_MONITOR_NAME="HDMI-1" # e.g: Your monitor that are connected sometimes to your laptop
ONLY_ONE_MONITOR_NAME="LVDS-1" # e.g: Laptop monitor name

# getting the monitor
connected_monitors=$(xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l)

if [[ $connected_monitors > 1 ]]; then
  monitor="$EXTERNAL_MONITOR_NAME"
else
  monitor="$ONLY_ONE_MONITOR_NAME"
fi

# assign the workspaces with bspc
assign_workspaces () {
  bspc monitor $monitor -d I II III IV V VI VII VIII IX
  if [[ $monitor == "$EXTERNAL_MONITOR_NAME" ]]; then
    bspc monitor $ONLY_ONE_MONITOR_NAME -d X
  fi
}

assign_workspaces
