#!/bin/bash

setopt () {
  bspc config $@
}

setopt normal_border_color "#323c41"
setopt focused_border_color "#a7c080"
