#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
killall i3bar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
while pgrep -u $UID -x i3bar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top &
nm-applet &
#polybar bar2 &

echo "Bars launched..." 
