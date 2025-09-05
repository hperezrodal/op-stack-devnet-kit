#!/bin/bash

MYHOME=$(pwd)

./scripts/build/l1/build.sh

cd $MYHOME

echo "Devnet built successfully"