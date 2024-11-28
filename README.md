# Zabbix-proxy image with odbc drivers

## Build

```
docker build -t zabbix-proxy-sqlite3-odbc:7.0.5-ubuntu --platform=linux/amd64 .
```


## Save image

```
docker image ls

REPOSITORY                  TAG            IMAGE ID       CREATED          SIZE
zabbix-proxy-sqlite3-odbc   7.0.5-ubuntu   36870de61357   11 minutes ago   249MB


docker image save zabbix-proxy-sqlite3-odbc:7.0.5-ubuntu | gzip > zabbix-proxy-sqlite3-odbc.tgz
```

## Load image

```
docker load < zabbix-proxy-sqlite3-odbc.tgz

docker image ls

REPOSITORY                  TAG            IMAGE ID       CREATED          SIZE
zabbix-proxy-sqlite3-odbc   7.0.5-ubuntu   26d706e61645   1 minutes ago   249MB
```


## Run

docker run -d --name zabbix-proxy zabbix-proxy-sqlite3-odbc:7.0.5-ubuntu


## Test

```
> cat /etc/odbcinst.ini

[PostgreSQL ANSI]
Description=PostgreSQL ODBC driver (ANSI version)
Driver=psqlodbca.so
Setup=libodbcpsqlS.so
Debug=0
CommLog=1
UsageCount=1

[PostgreSQL Unicode]
Description=PostgreSQL ODBC driver (Unicode version)
Driver=psqlodbcw.so
Setup=libodbcpsqlS.so
Debug=0
CommLog=1
UsageCount=1

[MariaDB Unicode]
Driver=libmaodbc.so
Description=MariaDB Connector/ODBC(Unicode)
Threading=0
UsageCount=1

[ODBC Driver 18 for SQL Server]
Description=Microsoft ODBC Driver 18 for SQL Server
Driver=/opt/microsoft/msodbcsql18/lib64/libmsodbcsql-18.4.so.1.1
UsageCount=1
```
