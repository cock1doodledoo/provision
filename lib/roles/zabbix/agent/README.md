zabbix agent recipe for [itamae](https://github.com/ryotarai/itamae "itamae")
===
- install zabbix-agent
- set the **zbx_hostname** that same as configuration on zabbix-server, and the **zbx_server** that incomming connections will be accepted form.  

## description
This recipe is to install zabbix-agent, to set the hostname and server from the attributes **zbx_hostname** and **zbx_server** on zabbix_agentd.conf by run on [itamae](https://github.com/ryotarai/itamae "itamae").

## attributes
- **zbx_hostname**: same as configuration on zabbix-server
- **zbx_server**: incomming connections will be accepted form

for example (yaml)
``` yaml
zbx_hostname: my_host
zbx_server: zbx_server
```
by default
``` yaml
zbx_hostname: hostname_must_override
zbx_server: zabbix_server
```

## depend on
- zabbix/common
