rosbag_always
======

# Description

This package enables us to record rosbag files and upload them automatically and periodically by crontab.
These bag files are cleaned up after uploading.

# Usage

## topic list

``emacs -nw `rospack find rosbag_always`config/topic_list.yaml``

## cron setting

```bash
crontab -l > /tmp/tmp-crontab
echo "0 10-22/1 * * * sudo -iu user-name /bin/bash -ic 'rosrun rosbag_always rosbag-record-duration.bash 5'" >> /tmp/tmp-crontab
echo "50 23 * * * sudo -iu user-name /bin/bash -ic 'rosrun rosbag_always rosbag-upload.bash google-acount /path/to/your/rosbag/directory/in/google/drive'" >> /tmp/tmp-crontab
crontab /tmp/tmp-crontab
```

or

```bash
crontab -e
```

```bash
crontab -l
0 10-22/1 * * * sudo -iu leus /bin/bash -ic 'rosrun rosbag_always rosbag-record-duration.bash 1m'
50 23 * * * sudo -iu leus /bin/bash -ic 'rosrun rosbag_always rosbag-upload.bash kuroiwa@jsk.imi.i.u-tokyo.ac.jp STARO-rosbag'
```
