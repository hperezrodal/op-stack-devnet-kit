#!/bin/bash

set -e

MYHOME=$(pwd)

TARGET_DIR=$DEPLOYMENT_DIR/l1/geth

cd $TARGET_DIR

docker compose down

cd $MYHOME

echo "Geth stopped successfully"