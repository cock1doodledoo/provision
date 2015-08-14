package 'zabbix-agent'
package 'zabbix-sender'

service 'zabbix-agent'

template '/etc/zabbix/zabbix_agentd.d/base.conf' do
  user 'root'
  owner 'root'
  group 'root'
  mode '644'
  variables(
    hostname: node[:zabbix_hostname],
    server: node[:zabbix_server]
  )
  notifies :restart, 'service[zabbix-agent]'
end
