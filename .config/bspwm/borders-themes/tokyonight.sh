#!/bin/bash

setopt () {
  bspc config $@
}

setopt normal_border_color "#1a1b26"
setopt focused_border_color "#7aa2f7"
