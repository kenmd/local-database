# Flyway SQL Server Starter


## Create Sample Database

```bash
export SA_PASSWORD=Password1

sqlcmd -S 127.0.0.1 -U sa -P $SA_PASSWORD \
    -Q "CREATE DATABASE db_example"
sqlcmd -S 127.0.0.1 -U sa -P $SA_PASSWORD \
    -Q "SELECT name FROM sys.databases"
```


## How to Run

```bash
brew install flyway
# or see https://flywaydb.org/getstarted/firststeps/commandline

# show current db version status
flyway info

# apply migration
flyway migrate

# check diff of db version and sql file version
flyway validate
```

Check the result

```bash
sqlcmd -S 127.0.0.1 -U sa -P $SA_PASSWORD -d db_example \
    -Q "SELECT * FROM person"
```


## Reference

* https://flywaydb.org/getstarted/
* https://flywaydb.org/documentation/commandline/
* https://qiita.com/opengl-8080/items/6368c19a06521b65a655
