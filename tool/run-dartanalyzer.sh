#!/usr/bin/env bash

dartanalyzer --version

for f in $(find . -name '*.dart')
do
  if [[ $f == *packages* ]]
  then
    continue
  fi
  dartanalyzer $f
done
