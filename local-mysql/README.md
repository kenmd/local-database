# Local MySQL


## Start

```bash
docker-compose up -d
docker-compose ps
docker-compose logs
```


## Connect

* from cli
  - `mysql -h 127.0.0.1 -P 3306 -D db_example -u docker -pdocker`
* Adminer: http://localhost:18080/
  - Server: `host.docker.internal:3306`
  - User: `root` or `docker`
  - Database: `db_example`
* Run inside container
  - `docker-compose exec mysql57 mysql -p`
  - `docker-compose exec mysql57 mysql -u docker -p`
  - `docker-compose exec mysql57 bash`


## Init data using Flyway

see [Flyway MySQL Starter](../flyway-mysql/README.md)


## Clean up

```bash
docker-compose down
```


## Reference

* https://qiita.com/A-Kira/items/f401aea261693c395966
* https://qiita.com/Manatee/items/58d0f98a15656ed65136
