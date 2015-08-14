remote_file '/etc/mysql/conf.d/zabbix.cnf' do
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[mysql]', :immediately
end

execute 'zabbix pre-install settings' do
  command "debconf-set-selections << __EOF__
zabbix-server-mysql zabbix-server-mysql/mysql/app-pass password #{node[:zabbix_password]}
zabbix-server-mysql zabbix-server-mysql/app-password-confirm password #{node[:zabbix_password]}
zabbix-server-mysql zabbix-server-mysql/mysql/admin-pass password #{node[:mysql_root_password]}
zabbix-server-mysql zabbix-server-mysql/db/dbname string #{node[:zabbix_database]}
zabbix-server-mysql zabbix-server-mysql/db/app-user string #{node[:zabbix_user]}
zabbix-server-mysql zabbix-server-mysql/database-type select mysql
zabbix-server-mysql zabbix-server-mysql/mysql/admin-user string root
zabbix-server-mysql zabbix-server-mysql/dbconfig-install boolean true
zabbix-server-mysql zabbix-server-mysql/mysql/method select unix socket
zabbix-server-mysql zabbix-server-mysql/dbconfig-upgrade boolean true
__EOF__"
  not_if 'zabbix_server --version | grep -sq "Zabbix server"'
end

package 'zabbix-server-mysql'
package 'zabbix-get'

service 'zabbix-server'

directory '/etc/zabbix/zabbix_server.d/' do
  owner 'root'
  group 'root'
  mode '755'
end

execute 'configure to include conf-files' do
  command 'cat << __EOF__ >> /etc/zabbix/zabbix_server.conf

Include=/etc/zabbix/zabbix_server.d/

__EOF__'
  not_if 'grep -sq "^Include=/etc/zabbix/zabbix_server.d/$" /etc/zabbix/zabbix_server.conf'
  notifies :restart, 'service[zabbix-server]'
end

remote_file '/etc/zabbix/zabbix_server.d/base.conf' do
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[zabbix-server]'
end

remote_file '/etc/zabbix/zabbix_server.d/snmptrap.conf' do
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[zabbix-server]'
end

package 'snmptt'

service 'snmptt'

execute 'enable snmptthandler' do
  command 'cat << __EOF__ >> /etc/snmp/snmptrapd.conf
authCommunity log,execute,net public
traphandle default /usr/sbin/snmptthandler
__EOF__'
  not_if 'grep -sq \'traphandle default /usr/sbin/snmptthandler\' /etc/snmp/snmptrapd.conf'
  notifies :restart, 'service[snmpd]'
end

execute 'set snmptrapd option' do
  command 'sed -i \'s/^TRAPDOPTS=.*/TRAPDOPTS="-m +ALL -Lsd -On -p $TRAPD_PID"/g\' /etc/init.d/snmpd'
  not_if 'grep -sq \'TRAPDOPTS=\"-m +ALL -Lsd -On -p $TRAPD_PID"\' /etc/init.d/snmpd'
  notifies :restart, 'service[snmpd]'
end

remote_file '/etc/snmp/snmptt.ini' do
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[snmptt]'
end

remote_file '/etc/snmp/snmptt.conf' do
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[snmptt]'
end
