#!/bin/bash -eux

# sample init shell script (see docker-compose.yml)

INIT_SQL="/docker-entrypoint-initdb.d/sql"
mysql -u docker -pdocker db_example < "$INIT_SQL/schema.sql"
mysql -u docker -pdocker db_example < "$INIT_SQL/data.sql"
