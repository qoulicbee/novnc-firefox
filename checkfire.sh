#!/bin/bash

check_process() {
  echo "$ts: checking $1"
  [ "$1" = "" ]  && return 0
  [ `pgrep -n $1` ] && return 1 || return 0
}

killDefunct() {
    for pid in $(ps axo pid=,stat= | awk '$2~/^Z/ { print $1 }') ; do
        echo "$pid" # do something interesting here
        sudo kill -9 $pid
    done
}

ts=`date +%T`
echo "$ts: begin checking..."
check_process "firefox"
[ $? -eq 0 ] && echo "$ts: not running, restarting..." && `firefox &`
sleep 5
