#!/usr/bin/env bash

find . -name '*_test.dart' | xargs dart --checked
