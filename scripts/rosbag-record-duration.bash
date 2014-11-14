#!/bin/bash

rosparam load `rospack find rosbag_always`/config/topic_list.yaml
tl_raw=`rosparam get /topic_list`
tl=`echo $tl_raw | cut -d"[" -f2 | cut -d"]" -f1`

mkdir -p `rospack find rosbag_always`/bags/`date +"%Y-%m-%d"`
rosbag record -o `rospack find rosbag_always`/bags/`date +"%Y-%m-%d"`/ --duration=$1 $tl
