snmp agent recipe
===
- install snmpd package

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to install snmpd package.
after installation, enabled snmptrapd if the attributes **snmp_enabled_trapd** is True and snmpd restart.
ubuntu14.04 is expected.

## attributes
for example
``` yaml
snmp_enabled_trapd: false # True if you want to enabled snmptrapd
```

## depend on
- nothing
