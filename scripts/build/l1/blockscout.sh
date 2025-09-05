#!/bin/bash

set -e

MYHOME=$(pwd)

cd build/l1/blockscout
./build.sh

cd $MYHOME

echo "L1 Blockscout built successfully"


