#!/bin/bash

set -e

MYHOME=$(pwd)

TARGET_DIR=$HOME/geth

cd $TARGET_DIR

docker compose up -d

cd $MYHOME

echo "Geth started successfully"