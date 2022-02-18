#!/bin/bash

setopt () {
  bspc config $@
}

setopt normal_border_color "#504945"
setopt focused_border_color "#a89984"
