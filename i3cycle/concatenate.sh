#!/bin/bash
i3ConfigPath="/home/dirwin/.config/i3/config"
dir=`dirname "$0"`
conf="$dir/conf"

cat $conf/base \
    $conf/colors \
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
