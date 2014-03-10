#!/usr/bin/env bash

for f in $(find . -name '*.dart')
do
  if [[ $f == *packages* ]]
  then
    continue
  fi
  mkdir -p $(dirname /tmp/$f)
  dartfmt --transform $f | head -n -1 > /tmp/$f
  DIFF=$(diff $f /tmp/$f)
  if [[ ${DIFF} ]]
  then
    echo "found non-dartfmt idempotence in $f"
    echo "${DIFF}"
    exit 1
  fi
done
