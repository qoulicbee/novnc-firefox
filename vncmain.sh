#!/bin/bash
export DISPLAY=:11
sudo -u user /home/user/checkfire.sh &
sudo -u root /home/user/checkdefun.sh &
xterm
