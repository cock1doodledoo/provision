require 'spec_helper'

describe package('squid3') do
  it { should be_installed }
end

describe service('squid3') do
  it { should be_enabled }
  it { should be_running }
end

describe port(3128) do
  it { should be_listening.on('::').with('tcp6') }
end

describe command('squid3 -v') do
  its(:stdout) { should match(/Squid Cache: Version 3.3.8/) }
end
