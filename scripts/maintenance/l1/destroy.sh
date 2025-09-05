#!/bin/bash

MYHOME=$(pwd)

./scripts/maintenance/l1/blockscout/destroy.sh
./scripts/maintenance/l1/geth/destroy.sh

cd $MYHOME

echo "L1 destroyed successfully"