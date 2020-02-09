#!/bin/bash -eux

# restore AdventureWorks2017.bak
docker-compose exec mssql \
    /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $SA_PASSWORD \
    -i /shared-data/create_sample_db_aw.sql
#   or /shared-data/create_sample_db_wwi.sql
