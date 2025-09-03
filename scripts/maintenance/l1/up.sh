#!/bin/bash

MYHOME=$(pwd)

./scripts/maintenance/geth/up.sh

sleep 10

./scripts/maintenance/blockscout/up.sh
