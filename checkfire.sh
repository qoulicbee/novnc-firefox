#!/bin/bash

check_process() {
  echo "$ts: checking $1"
  [ "$1" = "" ]  && return 0
  [ `pgrep -n $1` ] && return 1 || return 0
}
while [ 1 ]; do
    ts=`date +%T`
    echo "$ts: begin checking..."
    check_process "firefox"
    [ $? -eq 0 ] && echo "$ts: not running, restarting..." && `firefox &`
    sleep 5
done
