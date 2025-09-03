#!/bin/bash

set -e

MYHOME=$(pwd)

cd build/blockscout
./build.sh

cd $MYHOME

echo "Blockscout built successfully"


