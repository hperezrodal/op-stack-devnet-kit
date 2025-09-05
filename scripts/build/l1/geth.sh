#!/bin/bash

set -e

MYHOME=$(pwd)

cd build/l1/geth
./build.sh

cd $MYHOME

echo "L1 Geth built successfully"


