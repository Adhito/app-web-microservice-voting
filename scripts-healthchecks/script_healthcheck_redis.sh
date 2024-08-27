#!/bin/bash
## Configure the script will exit on any command failure 
set -eo pipefail

## Configure environment variable for hostname
host="$(hostname -i || echo '127.0.0.1')"

## Check if the Redis is reachable and operational
if ping="$(redis-cli -h "$host" ping)" && [ "$ping" = 'PONG' ]; then
	exit 0
fi

## Exit On Fail
exit 1
