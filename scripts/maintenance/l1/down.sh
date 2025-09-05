#!/bin/bash

MYHOME=$(pwd)

./scripts/maintenance/l1/blockscout/down.sh

sleep 10

./scripts/maintenance/l1/geth/down.sh

cd $MYHOME

echo "L1 stopped successfully"