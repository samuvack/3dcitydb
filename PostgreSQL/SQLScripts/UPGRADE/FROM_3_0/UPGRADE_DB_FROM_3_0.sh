#!/bin/sh
# Shell script to upgrade an instance of the 3D City Database
# on PostgreSQL/PostGIS from version 3.0 to 3.3

# Provide your database details here
export PGPORT=5432
export PGHOST=your_host_address
export PGUSER=your_username
export CITYDB=your_database
export PGBIN=path_to_psql

# cd to path of the shell script
cd "$( cd "$( dirname "$0" )" && pwd )" > /dev/null

# Run UPGRADE_DB_FROM_3_0.sql to upgrade the 3D City Database instance
"$PGBIN/psql" -d "$CITYDB" -f "UPGRADE_DB_FROM_3_0.sql"