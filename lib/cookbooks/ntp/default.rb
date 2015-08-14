node.validate! do
  {
    ntp_servers: array_of(string)
  }
end

package 'ntp'

service 'ntp'

template '/etc/ntp.conf' do
  user 'root'
  owner 'root'
  group 'root'
  mode '644'
  variables(servers: node[:ntp_servers])
  notifies :restart, 'service[ntp]'
end
