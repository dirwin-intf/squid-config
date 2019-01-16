#!/bin/bash
dir=`dirname "$0"`
newbg=`ruby $dir/CycleBackground.rb`

nitrogen $newbg --set-zoom-fill
pkill polybar
polybar bottom &
polybar top &
