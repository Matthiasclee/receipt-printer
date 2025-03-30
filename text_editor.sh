#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

xed /tmp/to_print.txt &

while true; do
  if [ -e "/tmp/to_print.txt" ]; then
    cat /tmp/to_print.txt | bash $DIR/print.sh $1
    rm /tmp/to_print.txt
    exit
  fi
done
