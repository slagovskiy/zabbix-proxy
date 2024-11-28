FROM zabbix/zabbix-proxy-sqlite3:7.0.5-ubuntu

USER root
RUN chown -R _apt:root /var/lib/apt/lists/

RUN apt update && apt install -y pgp curl && apt install -y odbcinst odbc-postgresql odbc-mariadb

COPY msodbc.sh /tmp

RUN chmod 777 /tmp/msodbc.sh && bash /tmp/msodbc.sh

USER zabbix
