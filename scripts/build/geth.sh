#!/bin/bash

set -e

MYHOME=$(pwd)

cd build/geth
./build.sh

cd $MYHOME

echo "Geth built successfully"


