#!/bin/bash

setopt () {
  bspc config $@
}

setopt normal_border_color "#181a29"
setopt focused_border_color "#93bbff"
