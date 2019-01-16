#!/bin/bash
dir=`dirname "$0"`

[ ! -f $dir/currentWallpaper.txt ] && touch $dir/currentWallpaper.txt && echo "placeholder" > $dir/currentWallpaper.txt

newbg=`ruby $dir/CycleBackground.rb`

nitrogen $newbg --set-zoom-fill
pkill polybar
polybar bottom &
polybar top &
