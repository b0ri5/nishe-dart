#!/usr/bin/env bash

set -e # Exit on error
set -x # Trace calls

tool/run-dartfmt-write.sh
tool/run-dartanalyzer.sh
tool/run-tests.sh
