#!/bin/bash

setopt () {
  bspc config $@
}

setopt normal_border_color "#0c0e15"
setopt focused_border_color "#41a7fc"
