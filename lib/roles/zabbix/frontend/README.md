zabbix frontend recipe for itamae
===
- install zabbix-frontend
- install japanese fonts for graph
- prepare apache2 and php for zabbix-fronend

## description
This recipe is to install zabbix-web-frontend, by run on [itamae](https://github.com/ryotarai/itamae "itamae").
prepare apache2, php, japanese-font for zabbix-web-frontend.

## attributes
- **zbx_user**: the user name that zabbix-frontend uses when connect to the database
- **zbx_pass**: the password that zabbix-frontend uses when connect to the database
- **zbx_db**: the database name that zabbix-frontend connect to

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
- zabbix/common
