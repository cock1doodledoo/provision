require 'spec_helper'

describe package('snmp') do
  it { should be_installed }
end

describe command('snmpget --version') do
  its(:stderr) { should match /^NET-SNMP version: 5.7.2$/ }
end
