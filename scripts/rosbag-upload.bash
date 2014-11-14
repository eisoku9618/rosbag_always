#!/bin/bash

dir_name=`rospack find rosbag_always`/bags/`date +"%Y-%m-%d"`
cd $dir_name
for i in *.bag
do
    google docs upload $dir_name/$i --folder "$2" --user=$1 --no-convert &
done
wait
rm -rf $dir_name
