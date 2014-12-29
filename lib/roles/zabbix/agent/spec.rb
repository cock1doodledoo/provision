require 'spec_helper'

describe package('zabbix-agent') do
  it { should be_installed }
end

describe package('zabbix-sender') do
  it { should be_installed }
end

describe service('zabbix-agent') do
  it { should be_enabled }
  it { should be_running }
end

describe command('zabbix_agent --version') do
  its(:stdout) { should match /^Zabbix agent v2.2.8/ }
end

describe command('zabbix_agentd --version') do
  its(:stdout) { should match /^Zabbix Agent \(daemon\) v2.2.8/ }
end

describe command('zabbix_sender --version') do
  its(:stdout) { should match /^Zabbix Sender v2.2.8/ }
end

describe file('/etc/zabbix/zabbix_agentd.conf') do
  it { should be_file }
  its(:content) { should match /^Include=\/etc\/zabbix\/zabbix_agentd.d\/$/ }
end

describe file('/etc/zabbix/zabbix_agentd.d/hostname.conf') do
  it { should be_file }
  its(:content) { should match /^Hostname=#{property[:zbx_hostname]}$/ }
  its(:content) { should match /^Server=#{property[:zbx_server]}$/ }
end
