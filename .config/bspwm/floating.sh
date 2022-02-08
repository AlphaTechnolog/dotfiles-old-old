# this file provides auto floating layout for floating lovers

FLOATING=0 # 1 to true, 0 to false

if [[ $FLOATING == 1 ]]; then
  bspc subscribe node_add | while read -a msg ; do
    wid=${msg[4]}
    bspc node "$wid" -t floating
  done &
fi
