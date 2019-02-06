#!/bin/bash
dir=`dirname "$0"`

# if there is no current wallpaper just create a place holder file so ChooseNewBackgroundAndColors doesn't blow up
[ ! -f $dir/currentWallpaper.txt ] && touch $dir/currentWallpaper.txt && echo "placeholder" > $dir/currentWallpaper.txt

newbg=`ruby $dir/ChooseNewBackgroundAndColors.rb $1`

nitrogen $newbg --set-zoom-fill
bash $dir/Barcycle/concatenate.sh
bash $dir/i3cycle/concatenate.sh
