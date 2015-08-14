zabbix frontend recipe
===
- install zabbix-frontend
- install japanese fonts for graph
- prepare apache2 and php for zabbix-fronend

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to install zabbix-web-frontend.
prepare apache2, php, japanese-font for zabbix-web-frontend.
ubuntu14.04 is expected.

## attributes
for example
``` yaml
zabbix_hostname: undefined_hostname # same as configuration on zabbix-server
zabbix_user: zabbix                 # zabbix-frontend uses when connect to the database
zabbix_password: zabbix             # zabbix-frontend uses when connect to the database
zabbix_database: zabbix             # zabbix-frontend connect to
```

## depend on
- mysql
- zabbix/common
