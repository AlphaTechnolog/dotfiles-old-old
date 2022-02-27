#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

DIR=$(dirname $0)

# monitor where polybar will run
MONITOR=HDMI1

_mw () {
  local content=$1
  local monitor_config_file=$DIR/monitor.ini
  echo "$content" >> $monitor_config_file
}

setup_monitor () {
  local monitor_config_file=$DIR/monitor.ini
  # create file if it don't exists
  if ! test -f $monitor_config_file; then
    touch $monitor_config_file
  else
    echo "" > $monitor_config_file
  fi
  _mw "[monitor]"
  _mw "monitor = $MONITOR"
}

setup_monitor $MONITOR

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar example -r >>/tmp/polybar1.log 2>&1 & disown
echo "Bars launched..."
