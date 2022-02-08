#!/bin/bash

# This script spawns polybar

# Env variables
ROOT=$HOME/.config/polybar

# Spawn polybar
#  NOTE: You can change this function as you want
main () {
  if test -d $ROOT; then
    bash $ROOT/launch.sh &
  fi
}

main
