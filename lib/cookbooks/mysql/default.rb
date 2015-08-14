node.validate! do
  {
    mysql_root_password: string,
    mysql_listen_port: integer
  }
end

execute 'mysql pre-install settings' do
  command "debconf-set-selections << __EOF__
mysql-server-5.5 mysql-server/root_password password #{node[:mysql_root_password]}
mysql-server-5.5 mysql-server/root_password_again password #{node[:mysql_root_password]}
__EOF__"
  user 'root'
  not_if 'mysql --version'
end

package 'mysql-server'

service 'mysql'

template '/etc/mysql/my.cnf' do
  user 'root'
  owner 'root'
  group 'root'
  mode '644'
  variables(port: node[:mysql_listen_port])
  notifies :restart, 'service[mysql]'
end
