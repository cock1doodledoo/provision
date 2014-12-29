require 'spec_helper'

describe package('snmpd') do
  it { should be_installed }
end

describe service('snmpd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(161) do
  it { should be_listening.on('0.0.0.0').with('udp') }
end

if property[:snmp_enable_trapd]
  describe port(162) do
    it { should be_listening.on('0.0.0.0').with('udp') }
  end
end

describe command('snmpd --version') do
  its(:stdout) { should match /^NET-SNMP version:  5.7.2$/ }
end
