#!/bin/bash
## Configure the script will exit on any command failure 
set -eo pipefail

## Configure environment variable for hostname, user, db and password
host="$(hostname -i || echo '127.0.0.1')"
user="${POSTGRES_USER:-postgres}"
db="${POSTGRES_DB:-$POSTGRES_USER}"
export PGPASSWORD="${POSTGRES_PASSWORD:-}"

## Configure a set of arguments for a command for postgres to not use the local unix socket 
args=(
	--host "$host"
	--username "$user"
	--dbname "$db"
	--quiet --no-align --tuples-only
)

## Check if the PostgreSQL database is reachable and operational
if select="$(echo 'SELECT 1' | psql "${args[@]}")" && [ "$select" = '1' ]; then
	exit 0
fi

## Exit On Fail
exit 1
