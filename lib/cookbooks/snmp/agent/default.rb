node.validate! do
  {
    snmp_enable_trapd: boolean
  }
end

package 'snmpd'

service 'snmpd'

remote_file '/etc/snmp/snmpd.conf' do
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[snmpd]'
end

execute 'enable snmptrapd' do
  command 'sed -i "s/TRAPDRUN=no/TRAPDRUN=yes/g" /etc/default/snmpd'
  only_if node[:snmp_enabled_trapd]
  not_if 'grep -sq TRAPDRUN=yes /etc/default/snmpd'
  notifies :restart, 'service[snmpd]'
end
