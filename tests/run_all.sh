#!/usr/bin/env zsh

# Run all tests in this folder
SCRIPT_DIR=${0:a:h}

echo "Running all tests."
echo  "SCRIPT_DIR: $SCRIPT_DIR"

echo "------------------------------\n\n"

for file in $SCRIPT_DIR/test*; do
    echo "Running: '$file'\n"
    $file
done
