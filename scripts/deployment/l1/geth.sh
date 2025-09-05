#!/bin/bash

set -e

MYHOME=$(pwd)

TARGET_DIR=$DEPLOYMENT_DIR/l1/geth

rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR

cp -r deployment/l1/geth/* $TARGET_DIR/

cd $TARGET_DIR
chmod +x ./config/entrypoint.sh

cd $MYHOME

echo "Geth deployed successfully"
