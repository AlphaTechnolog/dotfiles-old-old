#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/everforest

maxlen () {
  str=$1
  len=$2
  splittedlnrs=$(echo $str | fold -w $len | wc -l)
  splittedtext=$(echo $str | fold -w $len | head -n 1)
  printf "$splittedtext"
  if [ "$splittedlnrs" -gt "1" ]; then
    printf "..."
  fi
}

cpu() {
	cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

	printf "^c$black^ ^b$green^  CPU"
	printf "^c$white^ ^b$grey^ $cpu_val"
}

volume () {
  volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

	printf "^c$black^ ^b$yellow^  VOL"
	printf "^c$white^ ^b$grey^ $volume%%"
}

pkg_updates() {
  updates=$(cat $HOME/.updates)
	# updates=$(doas xbps-install -un | wc -l) # void
	# updates=$(checkupdates | wc -l)   # arch , needs pacman contrib
	# updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

	if [ -z "$updates" ]; then
		printf "^c$green^  Fully Updated"
	else
		printf "^c$green^  $updates"" updates"
	fi
}

mem() {
	printf "^c$blue^^b$black^  "
	printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%I:%M %p')  "
}

audio () {
  audio=$(playerctl metadata --format "{{ artist }}: {{ title }}" 2>&1)
	printf "^c$purple^^b$black^  "
  printf "^c$purple^ $(maxlen "$audio" 15)"
}

while true; do

	[ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
	interval=$((interval + 1))

  sleep 1 && xsetroot -name "$updates $(volume) $(audio) $(cpu) $(mem) $(wlan) $(clock)"
done
