require 'spec_helper'

describe package('zabbix-server-mysql') do
  it { should be_installed }
end

describe package('zabbix-get') do
  it { should be_installed }
end

describe service('zabbix-server') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/mysql/conf.d/zabbix.cnf') do
  it { should be_file }
end

describe command('zabbix_server --version') do
  its(:stdout) { should match(/^Zabbix server v2.2.9/) }
end

describe command('zabbix_get --version') do
  its(:stdout) { should match(/^Zabbix get v2.2.9/) }
end

describe command("echo 'show variables'|mysql --user=#{property[:zabbix_user]} --password=#{property[:zabbix_password]}") do
  let(:disable_sudo) { false }
  its(:stdout) { should match(/^character_set_server\tutf8$/) }
  its(:stdout) { should match(/^innodb_buffer_pool_size\t805306368$/) }
  its(:stdout) { should match(/^innodb_file_per_table\tON$/) }
  its(:stdout) { should match(/^general_log\tON$/) }
  its(:stdout) { should match(/^slow_query_log\tON$/) }
end

describe file('/etc/zabbix/zabbix_server.conf') do
  let(:disable_sudo) { false }
  it { should be_file }
  its(:content) { should match(%r{^Include=/etc/zabbix/zabbix_server.d/$}) }
end

describe file('/etc/zabbix/zabbix_server.d/base.conf') do
  it { should be_file }
  its(:content) { should match(/^ValueCacheSize=16M$/) }
end

describe file('/etc/zabbix/zabbix_server.d/snmptrap.conf') do
  it { should be_file }
  its(:content) { should match(%r{^SNMPTrapperFile=/var/log/snmptt/snmptt.log$}) }
  its(:content) { should match(/^StartSNMPTrapper=1$/) }
end

describe file('/etc/snmp/snmptrapd.conf') do
  let(:disable_sudo) { false }
  it { should be_file }
  its(:content) { should match(%r{^traphandle default /usr/sbin/snmptthandler$}) }
end

describe file('/etc/init.d/snmpd') do
  it { should be_file }
  its(:content) { should match(/^TRAPDOPTS="\-m \+ALL \-Lsd \-On \-p \$TRAPD_PID"$/) }
end

describe file('/etc/snmp/snmptt.ini') do
  it { should be_file }
  its(:content) { should match(/^mode = daemon$/) }
end

describe file('/etc/snmp/snmptt.conf') do
  it { should be_file }
  its(:content) { should match(/^FORMAT ZBXTRAP/) }
end
