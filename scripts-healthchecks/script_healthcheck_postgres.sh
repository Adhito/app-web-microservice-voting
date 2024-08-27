#!/bin/bash
## Configure the script will exit on any command failure 
set -eo pipefail

## Configure environment variable for hostname, user, db and password
host="$(hostname -i || echo '127.0.0.1')"
user="${POSTGRES_USER:-postgres}"
db="${POSTGRES_DB:-$POSTGRES_USER}"
export PGPASSWORD="${POSTGRES_PASSWORD:-}"