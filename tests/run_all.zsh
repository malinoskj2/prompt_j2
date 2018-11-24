#!/usr/bin/env zsh

# Run all tests in this folder

SCRIPT_DIR=${0:a:h}

local tests=($SCRIPT_DIR/test*)

for test in $tests ; do
  zsh $test
done
