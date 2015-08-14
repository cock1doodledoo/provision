require 'spec_helper'

describe package('mysql-server') do
  it { should be_installed }
end

describe service('mysql') do
  it { should be_enabled }
  it { should be_running }
end

describe command('mysql --version') do
  its(:stdout) { should match(/mysql  Ver 14.14 Distrib 5.5.44/) }
end

describe command("echo | mysql --user=root --password=#{property[:mysql_root_password]}") do
  its(:exit_status) { should eq 0 }
end

describe port(property[:mysql_listen_port]) do
  it { should be_listening.with('tcp') }
end
