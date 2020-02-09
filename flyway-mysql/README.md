# Flyway MySQL Starter


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
mysql -h 127.0.0.1 -P 3306 -D db_example -u docker -pdocker \
    -e "SELECT * FROM PERSON"
```


## Reference

* https://flywaydb.org/getstarted/
* https://flywaydb.org/documentation/commandline/
* https://qiita.com/opengl-8080/items/6368c19a06521b65a655
