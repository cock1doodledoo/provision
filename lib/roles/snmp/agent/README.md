snmp agent recipe for itamae
===
- install snmpd package

## description
This recipe is to install snmp agent, by run on [itamae](https://github.com/ryotarai/itamae "itamae").
after installation, enabled snmptrapd if the attributes **snmp_enabled_trapd** is True and snmpd restart if necessary.

## attributes
- **snmp_enabled_trapd**: True if you want to enabled snmptrapd

for example (yaml)
``` yaml
snmp_enabled_trapd: true
```
by default
``` yaml
snmp_enabled_trapd: false
```

## depend on
- nothing
