#!/bin/bash

ROOT=$(dirname $0)

# This script setups the commonly options
# using bspc to affect bspwm

function setopt () {
  local opt=$1
  local val=$2
  bspc config "$opt" "$val"
}

# borders and gaps
setopt border_width 0
setopt window_gap 12

# borders colors
BORDER_THEME='catppuccin'
load_border_theme() {
  name=${1}
  if test -f $ROOT/borders-themes/$name.sh; then
    bash $ROOT/borders-themes/$name.sh
  fi
}
load_border_theme "$BORDER_THEME"

# behaviour stuff
setopt split_ratio 0.52
setopt borderless_monocle true
setopt gapless_monocle true
setopt focus_follows_pointer true
setopt single_monocle true

# plank
bspc rule -a Plank layer=above manage=on border=off
