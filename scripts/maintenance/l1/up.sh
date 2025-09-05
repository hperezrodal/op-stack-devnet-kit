#!/bin/bash

MYHOME=$(pwd)

./scripts/maintenance/l1/geth/up.sh

sleep 10

./scripts/maintenance/l1/blockscout/up.sh

cd $MYHOME

echo "L1 started successfully"