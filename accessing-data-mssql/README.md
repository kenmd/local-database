# Test Access to Local SQL Server

Simple Spring Boot app to test access to local SQL Server


## Start

* run `flyway migrate` in `flyway-mssql`

```bash
./mvnw spring-boot:run
```


## Access

```bash
curl localhost:8082/demo/add -d id=123 -d name=someone

curl http://localhost:8082/demo/all

sqlcmd -S 127.0.0.1 -U sa -P $SA_PASSWORD -d db_example \
    -Q "SELECT * FROM PERSON" -W
ID NAME
-- ----
1 Axel
2 Mr. Foo
3 Ms. Bar
123 someone
```


## Reference

* https://spring.io/guides/gs/accessing-data-mysql/
* about Spring Data JDBC `@Query`
  - https://qiita.com/yoshikawaa/items/c25715df81ba0d18a74f
  - https://qiita.com/kazuki43zoo/items/bd63d28dc2348aa21719
