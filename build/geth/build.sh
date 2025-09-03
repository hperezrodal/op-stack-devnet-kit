#!/bin/bash

export $(grep -v '^#' env | xargs -d '\n')

MYHOME=$(pwd)

rm -rf $WORK_DIR

cp ./docker-compose.yml ../../deployment/geth/docker-compose.yml
cp -r ./config/* ../../deployment/geth/config

FILE_PATH="../../deployment/geth/docker-compose.yml"

sed -i "s|CHAIN_ID: .*|CHAIN_ID: $CHAIN_ID|" ../../deployment/geth/docker-compose.yml
sed -i "s|\"chainId\": .*|\"chainId\": $CHAIN_ID,|" "../../deployment/geth/config/genesis.json"
