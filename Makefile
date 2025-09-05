.PHONY: devnet-build l1-l1-geth-restart l1-geth-console l1-blockscout-restart l1-blockscout-db-psql

devnet-build:
	. ./set-env.sh && ./scripts/build/devnet.sh

devnet-init:
	. ./set-env.sh && ./scripts/deployment/devnet.sh

devnet-reset:
	. ./set-env.sh && ./scripts/maintenance/destroy.sh && ./scripts/deployment/devnet.sh && ./scripts/maintenance/up.sh

devnet-up:
	. ./set-env.sh && ./scripts/maintenance/up.sh

devnet-restart:
	. ./set-env.sh && ./scripts/maintenance/down.sh && ./scripts/maintenance/up.sh

devnet-down:
	. ./set-env.sh && ./scripts/maintenance/down.sh

devnet-destroy:
	. ./set-env.sh && ./scripts/maintenance/destroy.sh

devnet-pipeline:
	make devnet-down && \
	make devnet-destroy && \
	make devnet-build && \
	make devnet-init && \
	make devnet-up	

l1-geth-restart:
	. ./set-env.sh && ./scripts/maintenance/l1/geth/down.sh && ./scripts/maintenance/l1/geth/up.sh

l1-geth-logs:
	. ./set-env.sh && docker logs -f geth

l1-geth-console:
	. ./set-env.sh && ./scripts/maintenance/l1/geth/console.sh

l1-blockscout-restart:
	. ./set-env.sh && ./scripts/maintenance/l1/blockscout/down.sh && ./scripts/maintenance/l1/blockscout/up.sh

l1-blockscout-db-psql:
	. ./set-env.sh && ./scripts/maintenance/l1/blockscout/psql.sh
