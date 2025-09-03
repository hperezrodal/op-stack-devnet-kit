#!/bin/bash

set -e

MYHOME=$(pwd)

TARGET_DIR=$HOME/geth

cd $TARGET_DIR

docker compose down

cd $MYHOME

echo "Geth stopped successfully"