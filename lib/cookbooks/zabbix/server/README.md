zabbix server recipe
===
- install zabbix-server-mysql
- prepare mysql-server for zabbix-server

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to install zabbix-server-mysql package.
prepare mysql-server for zabbix-server-mysql, and restart mysql-server if necessary.
ubuntu14.04 is expected.

## attributes
for example
``` yaml
zabbix_user: zabbix     # zabbix-server uses when connect to the database
zabbix_password: zabbix # zabbix-server uses when connect to the database
zabbix_database: zabbix # zabbix-server connect to
```

## depend on
- debconf
- mysql
- snmp/server
- zabbix/common
