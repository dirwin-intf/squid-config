#!/bin/bash
dir=`dirname "$0"`

[ ! -f $dir/currentWallpaper.txt ] && touch $dir/currentWallpaper.txt && echo "placeholder" > $dir/currentWallpaper.txt

newbg=`ruby $dir/ChooseNewBackgroundAndColors.rb $1`

nitrogen $newbg --set-zoom-fill
pkill polybar &> /dev/null
polybar bottom &> /dev/null &
polybar top &> /dev/null &
