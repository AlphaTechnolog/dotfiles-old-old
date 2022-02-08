#!/bin/bash

setopt () {
  bspc config $@
}

setopt normal_border_color "#1e1d2d"
setopt focused_border_color "#A4B9EF"
