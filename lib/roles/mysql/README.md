mysql recipe for itamae
===
- install mysql-server package
- set the root password on mysql server
- set the port number mysqld listening

## description
This recipe is to install mysql-server, by run on [itamae](https://github.com/ryotarai/itamae "itamae").
and to set the root password from the attribures **mysql_root_pass**, by using debconf-utils.
after installation, set the mysql listen port from the attributes **mysql_listen_port** and mysqld restart if necessary.

## attributes
- **mysql_root_pass**: the password of root user on mysql server
- **mysql_listen_port**: the port number to use when mysqld listening

for example (yaml)
``` yaml
mysql_root_pass: database_administrator_password
mysql_listen_port: 3563
```
by default
``` yaml
mysql_root_pass: ''
mysql_listen_port: 3306
```

## depend on
- debconf
