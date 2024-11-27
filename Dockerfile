FROM zabbix/zabbix-proxy-sqlite3:7.0.5-ubuntu

USER root
RUN chown -R _apt:root /var/lib/apt/lists/

COPY msodbc.sh /tmp

RUN chmod 777 /tmp/msodbc.sh && /tmp/msodbc.sh

RUN apt update && apt install -y odbcinst odbc-postgresql odbc-mariadb && rm -rf /var/lib/apt/lists/*

USER zabbix
