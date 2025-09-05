#!/bin/bash

RESPONSE=$(curl -s -X POST http://$L1_RPC_URL:8545 \
  -H "Content-Type: application/json" \
  --data '{
    "jsonrpc":"2.0",
    "method":"eth_getBalance",
    "params":["0x1090495c9bc80106a8e42d89e10fd58adbda409b", "latest"],
    "id":1
  }')

echo $RESPONSE

BALANCE_HEX=$(jq -r '.result' <<< $RESPONSE)
BALANCE_DEC=$(echo "ibase=16; ${BALANCE_HEX:2}" | bc)
printf "balance: %s\n" $BALANCE_DEC