ntp recipe for itamae
===
- install ntp package
- set the ntp servers from the attributes

## description
This recipe is to install ntp, by run on [itamae](https://github.com/ryotarai/itamae "itamae").
after installation, set the ntp servers from the attributes **ntp_servers** and ntpd restart if necessary.

## attributes
- **ntp_servers**: array of ntp servers (IP address or FQDN)

for examples (yaml)
``` yaml
ntp_servers:
  - ntp-server1
  - ntp-server2
  - ntp-server3
```
by default
``` yaml
ntp_servers:
  - 0.ubuntu.pool.ntp.org
  - 1.ubuntu.pool.ntp.org
  - 2.ubuntu.pool.ntp.org
  - 3.ubuntu.pool.ntp.org
```

## depend on
- nothing
