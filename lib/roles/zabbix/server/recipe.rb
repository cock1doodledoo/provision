remote_file '/etc/mysql/conf.d/zabbix.cnf' do
  source 'mysql-zabbix.cnf'
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[mysql]', :immediately
end

execute 'zabbix pre-install settings' do
  command "debconf-set-selections << __EOF__
zabbix-server-mysql zabbix-server-mysql/mysql/app-pass password #{node[:zbx_pass]}
zabbix-server-mysql zabbix-server-mysql/app-password-confirm password #{node[:zbx_pass]}
zabbix-server-mysql zabbix-server-mysql/mysql/admin-pass password #{node[:mysql_root_pass]}
zabbix-server-mysql zabbix-server-mysql/db/dbname string #{node[:zbx_db]}
zabbix-server-mysql zabbix-server-mysql/db/app-user string #{node[:zbx_user]}
zabbix-server-mysql zabbix-server-mysql/database-type select mysql
zabbix-server-mysql zabbix-server-mysql/mysql/admin-user string root
zabbix-server-mysql zabbix-server-mysql/dbconfig-install boolean true
zabbix-server-mysql zabbix-server-mysql/mysql/method select unix socket
zabbix-server-mysql zabbix-server-mysql/dbconfig-upgrade boolean true
__EOF__"
  not_if 'zabbix_server --version'
end

package 'zabbix-server-mysql'
package 'zabbix-get'

service 'zabbix-server'
