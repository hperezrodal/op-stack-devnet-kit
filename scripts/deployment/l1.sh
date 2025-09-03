#!/bin/bash

MYHOME=$(pwd)

cd $HOME/blockscout/docker-compose
docker compose down -v

cd $HOME/geth
docker compose down -v
docker volume rm geth_geth-data

cd $MYHOME

sudo rm -rf $HOME/geth
./scripts/build/geth.sh && \
./scripts/deployment/geth.sh

sudo rm -rf $HOME/blockscout
./scripts/build/blockscout.sh && \
./scripts/deployment/blockscout.sh