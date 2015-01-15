package 'squid3'

service 'squid3'

remote_file '/etc/squid3/squid.conf' do
  source 'squid.conf'
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[squid3]'
end
