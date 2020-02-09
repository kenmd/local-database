# Test Access to Local MySQL

Simple Spring Boot app to test access to local MySQL


## Start

```bash
./mvnw spring-boot:run
```


## Access

```bash
curl localhost:8081/demo/add \
    -d name=First \
    -d email=someemail@someemailprovider.com

curl http://localhost:8081/demo/all

mysql -h 127.0.0.1 -P 3306 -D db_example \
    -u docker -pdocker -e "select * from user"
+----+---------------------------------+-------+
| id | email                           | name  |
+----+---------------------------------+-------+
|  1 | someemail@someemailprovider.com | First |
+----+---------------------------------+-------+
```


## Reference

* https://spring.io/guides/gs/accessing-data-mysql/
