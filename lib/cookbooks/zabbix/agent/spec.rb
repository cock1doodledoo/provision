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
  its(:stdout) { should match(/^Zabbix agent v2.2.9/) }
end

describe command('zabbix_agentd --version') do
  its(:stdout) { should match(/^Zabbix Agent \(daemon\) v2.2.9/) }
end

describe command('zabbix_sender --version') do
  its(:stdout) { should match(/^Zabbix Sender v2.2.9/) }
end

describe file('/etc/zabbix/zabbix_agentd.conf') do
  it { should be_file }
  its(:content) { should match %r{^Include=/etc/zabbix/zabbix_agentd.d/$} }
end

describe file('/etc/zabbix/zabbix_agentd.d/base.conf') do
  it { should be_file }
  its(:content) { should match(/^Hostname=#{property[:zabbix_hostname]}$/) }
  its(:content) { should match(/^Server=#{property[:zabbix_server]}$/) }
end
