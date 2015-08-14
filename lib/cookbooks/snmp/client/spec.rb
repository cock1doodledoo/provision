require 'spec_helper'

describe package('snmp') do
  it { should be_installed }
end

describe command('snmpget --version') do
  its(:stderr) { should match(/NET-SNMP version: 5.7.2/) }
end

describe package('snmp-mibs-downloader') do
  it { should be_installed }
end

describe file('/etc/snmp/snmp.conf') do
  it { should be_file }
  its(:content) { should_not match(/^mibs/) }
end
