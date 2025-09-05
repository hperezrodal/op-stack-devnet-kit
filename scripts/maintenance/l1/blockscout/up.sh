#!/bin/bash

set -e

MYHOME=$(pwd)

TARGET_DIR=$DEPLOYMENT_DIR/l1/blockscout

cd $TARGET_DIR/docker-compose

docker compose up -d --build

cd $MYHOME

echo "Blockscout started successfully"