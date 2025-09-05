#!/bin/bash

MYHOME=$(pwd)

##./scripts/maintenance/l2/down.sh

##sleep 10

./scripts/maintenance/l1/down.sh

cd $MYHOME

echo "Devnet stopped successfully"