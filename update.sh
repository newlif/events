#!/bin/bash
#pull changes from git and build upcoming page
#commented out until git is running again  sudo -u apache -H bash -c "git pull"
sudo -u apache -H bash -c "/usr/local/bin/writeup upcoming.txt"
writeup build.txt -o build_4490570.php
# Update Permissions by running this:
# chown -R apache /home/plousia/nlife2/git/events
# See also for github hooks:
# https://gist.github.com/cowboy/619858
# https://gist.github.com/phedoreanu/11321236
