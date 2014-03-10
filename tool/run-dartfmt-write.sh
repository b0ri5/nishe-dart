#!/usr/bin/env bash

for f in $(find . -name '*.dart')
do
  if [[ $f == *packages* ]]
  then
    continue
  fi
  dartfmt --transform --write $f
done
