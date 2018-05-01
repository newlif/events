#!/bin/bash
# build upcoming page using ssh andrewfountain upcoming.sh
# can also be done from http://nlife.ca/git/events/build_4490570.php
S=/home/plousia/nlife2/git/events
echo "writing writeup to update $S/upcoming.html"
sudo -u apache -H bash -c "/usr/local/bin/writeup -v $S/upcoming.txt"
chown -R apache $S
