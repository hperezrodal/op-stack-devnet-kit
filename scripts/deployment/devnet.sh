#!/bin/bash

MYHOME=$(pwd)

mkdir -p $DEPLOYMENT_DIR

./scripts/deployment/l1/deploy.sh

cd $MYHOME

echo "Devnet deployed successfully"