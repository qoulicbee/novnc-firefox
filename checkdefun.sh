#!/bin/sh

killDefunct() {
    for pid in $(ps axo pid=,stat= | awk '$2~/^Z/ { print $1 }') ; do
        echo "$pid" # do something interesting here
        sudo kill -9 $pid
    done
}

while [ 1 ]; do
  # timestamp
  ts=`date +%T`

  echo "$ts: begin checking..."
  killDefunct
  sleep 5
done
