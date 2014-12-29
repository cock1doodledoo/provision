package 'zabbix-agent'
package 'zabbix-sender'

service 'zabbix-agent'

template '/etc/zabbix/zabbix_agentd.d/base.conf' do
  source 'zabbix_base.conf.erb'
  user 'root'
  owner 'root'
  group 'root'
  mode '644'
  variables(
    hostname: node[:zbx_hostname],
    server: node[:zbx_server],
    )
  notifies :restart, 'service[zabbix-agent]'
end
