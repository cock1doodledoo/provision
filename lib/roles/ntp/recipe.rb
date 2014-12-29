package 'ntp'

service 'ntp'

template '/etc/ntp.conf' do
  source 'ntp.conf.erb'
  user 'root'
  owner 'root'
  group 'root'
  mode '644'
  variables(servers: node[:ntp_servers])
  notifies :restart, 'service[ntp]'
end
