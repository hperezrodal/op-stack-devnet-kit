#!/bin/bash

MYHOME=$(pwd)

mkdir -p $DEPLOYMENT_DIR

./scripts/deployment/l1/geth.sh
./scripts/deployment/l1/blockscout.sh

cd $MYHOME