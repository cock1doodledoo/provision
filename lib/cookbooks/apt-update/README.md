apt-update recipe
===
- keep apt-database latest
- upgrade packages if attribute **apt_upgrade** is true

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to keep apt-database latest.
ubuntu14.04 is expected.

## attributes
example
``` yaml
apt_upgrade: false # if you need to upgrade, replace this 'true'.
```

## depend on
- nothing
