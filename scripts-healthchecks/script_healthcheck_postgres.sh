#!/bin/bash
## Configure the script will exit on any command failure 
set -eo pipefail

## Configure environment variable for hostname, user, db and password
host="$(hostname -i || echo '127.0.0.1')"
user="${POSTGRES_USER:-postgres}"
db="${POSTGRES_DB:-$POSTGRES_USER}"
export PGPASSWORD="${POSTGRES_PASSWORD:-}"

## Create a set of arguments for a command for postgres to not use the local unix socket 
args=(
	--host "$host"
	--username "$user"
	--dbname "$db"
	--quiet --no-align --tuples-only
)