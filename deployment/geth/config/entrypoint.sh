#!/bin/bash
set -exu

VERBOSITY=${GETH_VERBOSITY:-3}
GETH_DATA_DIR=/db
GETH_CHAINDATA_DIR="$GETH_DATA_DIR/geth/chaindata"
GENESIS_FILE_PATH="${GENESIS_FILE_PATH:-/genesis.json}"
RPC_PORT="${RPC_PORT:-8545}"
WS_PORT="${WS_PORT:-8546}"
ETHERBASE_ADDRESS=${ETHERBASE_ADDRESS:-""}

if [ ! -d "$GETH_CHAINDATA_DIR" ]; then
    echo "$GETH_CHAINDATA_DIR missing, running init"
    echo "Initializing genesis."
    geth --verbosity="$VERBOSITY" init \
        --datadir="$GETH_DATA_DIR" \
        "$GENESIS_FILE_PATH"
else
    echo "$GETH_CHAINDATA_DIR exists."
fi

# If etherbase is not set, use the first available account
if [ -z "$ETHERBASE_ADDRESS" ]; then
    # Function to get the first available account address
    
    # Check if accounts already exist, if not, create a new one
    if [ ! -f "$GETH_DATA_DIR/keystore/"* ]; then
        echo "🔑 No existing accounts found, creating new account..."
        geth account new --datadir="$GETH_DATA_DIR" --password /db/password.txt
    fi
    
    # Get the address of the first account (new or existing)
    ETHERBASE_ADDRESS=$(geth --datadir="$GETH_DATA_DIR" account list | head -n1 | awk -F'[{}]' '{print "0x"$2}')
    echo "⚡ Using account $ETHERBASE_ADDRESS as etherbase"
fi

# Warning: Archive mode is required, otherwise old trie nodes will be pruned
# within minutes of starting the devnet.

exec geth \
    --datadir="$GETH_DATA_DIR" \
    --verbosity="$VERBOSITY" \
    --http \
    --http.corsdomain="*" \
    --http.vhosts="*" \
    --http.addr=0.0.0.0 \
    --http.port="$RPC_PORT" \
    --http.api=web3,debug,eth,txpool,net,engine,personal,miner \
    --ws \
    --ws.addr=0.0.0.0 \
    --ws.port="$WS_PORT" \
    --ws.origins="*" \
    --ws.api=debug,eth,txpool,net,engine \
    --syncmode=full \
    --nodiscover \
    --maxpeers=10 \
    --networkid=$CHAIN_ID \
    --rpc.allow-unprotected-txs \
    --authrpc.addr="0.0.0.0" \
    --authrpc.port="8551" \
    --authrpc.vhosts="*" \
    --authrpc.jwtsecret=/config/jwt.txt \
    --gcmode=archive \
    --metrics \
    --metrics.addr=0.0.0.0 \
    --metrics.port=6060 \
    --miner.etherbase "$ETHERBASE_ADDRESS" \
    --mine \
	--miner.threads=1 \
    "$@"
