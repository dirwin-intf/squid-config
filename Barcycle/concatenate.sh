#!/bin/bash
dir=`dirname "$0"`
conf="$dir/conf"
source $dir/../configPaths.sh

cat $conf/color \
    $conf/global \
    $conf/top \
    $conf/bottom \
    $conf/modules \
    > $polybarConfigPath

pkill polybar &> /dev/null
polybar top &> /dev/null &
polybar bottom &> /dev/null &
