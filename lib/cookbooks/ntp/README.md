ntp recipe
===
- install ntp package
- set the ntp servers from the attributes

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to install ntp package.
after installation, set the ntp servers from the attributes **ntp_servers** and ntpd restart if necessary.
ubuntu14.04 is expected.

## attributes
for example
``` yaml
ntp_servers: # array of ntp servers (IP address or FQDN)
  - 0.ubuntu.pool.ntp.org
  - 1.ubuntu.pool.ntp.org
  - 2.ubuntu.pool.ntp.org
  - 3.ubuntu.pool.ntp.org
```

## depend on
- nothing
