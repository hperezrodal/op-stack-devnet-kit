#!/bin/bash

MYHOME=$(pwd)

./scripts/maintenance/l1/up.sh

sleep 10

#./scripts/maintenance/l2/up.sh

cd $MYHOME

echo "Devnet started successfully"