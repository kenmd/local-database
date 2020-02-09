# Local MS SQL Server


## Start

```bash
# The password must be at least 8 characters long and
# contain characters from three of the following four sets:
# Uppercase letters, Lowercase letters, Base 10 digits, and Symbols.

export SA_PASSWORD=Password1

docker-compose up -d
docker-compose logs -f

# check
docker-compose exec mssql /opt/mssql-tools/bin/sqlcmd \
    -S localhost -U SA -P $SA_PASSWORD -Q "SELECT @@VERSION"
# it should show Microsoft SQL Server 2017

# go into container and run bash
docker-compose exec mssql bash
```

### Custom port note

* To change port, `ports` in `docker-compose.yml` e.g. `11433:1433`
* then connect to `127.0.0.1,11433` (Note to use "," instead of ":")


## Connect

```bash
# install SQLCMD on local Mac
brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release
export ACCEPT_EULA=y
brew install msodbcsql mssql-tools

# using local SQLCMD
sqlcmd -S 127.0.0.1 -U sa -P $SA_PASSWORD \
    -Q "SELECT name FROM sys.databases"

# using Container SQLCMD
docker-compose exec mssql \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD

# mssql-cli https://github.com/dbcli/mssql-cli
mssql-cli -S 127.0.0.1 -U sa -P $SA_PASSWORD

# GUI tool
brew cask install azure-data-studio
```


## Restore Sample DB

```bash
# download and copy bak file to shared-data/backup/
# * AdventureWorks2017.bak
# https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks

curl -L -o shared-data/backup/AdventureWorks2017.bak \
    https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak

./create_sample_db.sh

# connect AdventureWorks2017 database
sqlcmd -S 127.0.0.1 -U sa -P $SA_PASSWORD -d AdventureWorks2017
```


## Dump and restore by CLI mssql-scripter

* `mssql-scripter` is equivalent of Generate Scripts Wizard in SSMS.
* run `pip install mssql-scripter` to install (or `pipenv install`)
* details in https://github.com/microsoft/mssql-scripter

```bash
# Dump database object schema
mssql-scripter -S localhost -U sa -P $SA_PASSWORD \
    -d AdventureWorks2017 -f ./schema/adventureworks.sql

# Dump database object data
mssql-scripter -S localhost -U sa -P $SA_PASSWORD \
    -d AdventureWorks2017 -f ./data/adventureworks.sql --data-only

# Note: use --schema-and-data to dump both

# Tips: set environment variable for convenience
export MSSQL_SCRIPTER_CONNECTION_STRING="Server=localhost;Database=AdventureWorks2017;User Id=sa;Password=$SA_PASSWORD;"
```

```bash
# Restore using the generated above script with sqlcmd
sqlcmd -S localhost -U sa -P $SA_PASSWORD -i ./schema/adventureworks.sql
```


## Clean up

```bash
docker-compose down

# if you run pipenv install
pipenv --rm
```


## Reference

* mssql-scripter: mysqldump equivalent for SQLServer
  - https://github.com/microsoft/mssql-scripter
