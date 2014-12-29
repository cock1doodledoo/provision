require 'spec_helper'

describe package('ntp') do
  it { should be_installed }
end

describe service('ntp') do
  it { should be_enabled }
  it { should be_running }
end

describe port(123) do
  it { should be_listening }
end

describe command('ntpq -np') do
  property[:ntp_servers].each do |server|
    its(:stdout) { should match /^[\s\+\#\*o]#{server}/ }
  end
end

describe command('ntpd --version') do
  its(:stdout) { should match /^ntpd 4.2.6/ }
end
