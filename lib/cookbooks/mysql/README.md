mysql recipe
===
- install mysql-server package
- set the root password on mysql server
- set the port number mysqld listening

## description
[itamae](https://github.com/itamae-kitchen/itamae "itamae") recipe to install mysql-server package.
and to set the root password from the attribures **mysql_root_password**, by using debconf-utils.
after installation, set the mysql listen port from the attributes **mysql_listen_port** and mysqld restart if necessary.
ubuntu14.04 is expected.

## attributes
for example
``` yaml
mysql_root_password: '' # the password of root user on mysql server
mysql_listen_port: 3306 # the port number to use when mysqld listening
```

## depend on
- debconf
