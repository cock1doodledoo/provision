zabbix server recipe for itamae
===
- install zabbix-server-mysql
- prepare mysql-server for zabbix-server

## description
This recipe is to install zabbix-server-mysql, by run on [itamae](https://github.com/ryotarai/itamae "itamae").
prepare mysql-server for zabbix-server-mysql, and restart mysql-server if necessary.

## attributes
- **zbx_user**: the user name that zabbix-server uses when connect to the database
- **zbx_pass**: the password that zabbix-server uses when connect to the database
- **zbx_db**: the database name that zabbix-server connect to

for examples (yaml)
``` yaml
zbx_user: zabbix_username
zbx_pass: zabbix_password
zbx_db: zabbix_database_name
```
by default
``` yaml
zbx_user: zabbix
zbx_pass: zabbix
zbx_db: zabbix
```

## depend on
- debconf
- mysql
- zabbix/common
