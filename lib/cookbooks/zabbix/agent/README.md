zabbix agent recipe
===
- install zabbix-agent package
- set the **zabbix_hostname** that same as configuration on zabbix-server, and the **zabbix_server** that incomming connections will be accepted from.  

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to install zabbix-agent package,
and set the hostname and server from the attributes **zabbix_hostname** and **zabbix_server** on `zabbix_agentd.conf`.
ubuntu14.04 is expected.

## attributes
for example
``` yaml
zabbix_hostname: undefined_hostname # same as configuration on zabbix-server
zabbix_server: zabbix               # incomming connections will be accepted form
```

## depend on
- zabbix/common
