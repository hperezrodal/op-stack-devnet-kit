#!/bin/bash

set -e

MYHOME=$(pwd)

TARGET_DIR=$DEPLOYMENT_DIR/l1/blockscout

cd $TARGET_DIR/docker-compose

docker compose down

cd $MYHOME

echo "Blockscout stopped successfully"