package 'snmp'

package 'snmp-mibs-downloader'

execute 'enable mibs' do
  command 'sed -i \'s/^mibs :/# mibs :/g\' /etc/snmp/snmp.conf'
  only_if 'grep -sq \'^mibs :\' /etc/snmp/snmp.conf'
end
