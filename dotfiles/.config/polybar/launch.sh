#!/usr/bin/env bash

poybar_log=/home/rauger/.config/polybar/polybar.log
# Terminate already running bar instances
echo "Terminating already running bar instances" >  $polybar_log
killall -q polybar
killall i3bar
killall nm-applet
killall volumeicon
killall blueman-applet
kill $(ps aux | grep brightness-controller | awk '{print $2}')

# Wait until the processes have been shut down
echo "Waiting for polybar to die" >>  $polybar_log
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
echo "Waiting for i3bar to die" >>  $polybar_log
while pgrep -u $UID -x i3bar >/dev/null; do sleep 1; done
echo "Waiting for nm-applet to die" >>  $polybar_log
while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
echo "Waiting for volumeicon to die" >>  $polybar_log
while pgrep -u $UID -x volumeicon >/dev/null; do sleep 1; done 
echo "Waiting for blueman-applet to die" >>  $polybar_log
while pgrep -u $UID -x blueman-applet >/dev/null; do sleep 1; done 


# Launch bars
echo "Launching bars!" >>  $polybar_log
polybar top &
polybar bottom &
polybar laptop &
polybar lapbottom &
sleep 5
volumeicon &
nm-applet &
blueman-applet &
brightness-controller &
echo "Bars launched..." >> $polybar_log
