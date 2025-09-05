#!/bin/bash

MYHOME=$(pwd)

##./scripts/maintenance/l2/destroy.sh

##sleep 10

./scripts/maintenance/l1/destroy.sh

rm -rf $DEPLOYMENT_DIR

cd $MYHOME

echo "Devnet destroyed successfully"