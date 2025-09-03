#!/bin/bash

set -e

MYHOME=$(pwd)

TARGET_DIR=$HOME/blockscout

rm -rf $TARGET_DIR

git clone https://github.com/blockscout/blockscout.git $TARGET_DIR

cp -r deployment/blockscout/* $TARGET_DIR/

cd $TARGET_DIR

echo "Blockscout deployed successfully"

cd $MYHOME