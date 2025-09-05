#!/bin/bash

MYHOME=$(pwd)

./scripts/build/l1/geth.sh
./scripts/build/l1/blockscout.sh

cd $MYHOME

echo "L1 built successfully"