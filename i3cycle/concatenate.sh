#!/bin/bash
dir=`dirname "$0"`
conf="$dir/conf"
source $dir/../configPaths.sh

cat $conf/base \
    $conf/color \
    $conf/behavior \
    $conf/hardware \
    $conf/autostart \
    $conf/launch \
    $conf/container \
    $conf/workspace \
    $conf/resize \
    $conf/gaps \
    > $i3ConfigPath

i3-msg reload
