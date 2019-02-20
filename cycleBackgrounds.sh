#!/bin/bash
dirName=`dirname "$0"`
while :
do
  $dirName/execute.sh
  sleep 600
done
