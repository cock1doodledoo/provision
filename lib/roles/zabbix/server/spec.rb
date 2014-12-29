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
  its(:stdout) { should match /^Zabbix server v2.2.8/ }
end

describe command('zabbix_get --version') do
  its(:stdout) { should match /^Zabbix get v2.2.8/ }
end

describe command("echo 'show variables'|mysql --user=#{property[:zbx_user]} --password=#{property[:zbx_pass]}") do
  let(:disable_sudo) { false }
  its(:stdout) { should match /^character_set_server\tutf8$/ }
  its(:stdout) { should match /^innodb_buffer_pool_size\t805306368$/ }
  its(:stdout) { should match /^innodb_file_per_table\tON$/ }
  its(:stdout) { should match /^general_log\tON$/ }
  its(:stdout) { should match /^slow_query_log\tON$/ }
end
