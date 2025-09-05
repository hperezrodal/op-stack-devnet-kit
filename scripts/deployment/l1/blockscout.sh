#!/bin/bash

set -e

MYHOME=$(pwd)

TARGET_DIR=$DEPLOYMENT_DIR/l1/blockscout

rm -rf $TARGET_DIR

git clone https://github.com/blockscout/blockscout.git $TARGET_DIR

cp -r deployment/l1/blockscout/* $TARGET_DIR/

cd $TARGET_DIR

echo "Blockscout deployed successfully"

cd $MYHOME