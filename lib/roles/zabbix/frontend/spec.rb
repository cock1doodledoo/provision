require 'spec_helper'

describe package('fonts-mona') do
  it { should be_installed }
end

describe package('zabbix-frontend-php') do
  it { should be_installed }
end

describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/zabbix/apache.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_readable.by 'others' }
  its(:content) { should match /Alias \/zabbix \/usr\/share\/zabbix/ }
  it { should contain(/php_value date.timezone Asia\/Tokyo/).from(/<Directory "\/usr\/share\/zabbix">/).to(/<\/Directory>/) }
end

describe file('/etc/zabbix/web/zabbix.conf.php') do
  it { should be_file }
  it { should be_owned_by 'www-data' }
  it { should be_readable.by 'owner' }
end

describe file('/var/www/html/phpinfo.php') do
  it { should be_file }
  it { should be_owned_by 'www-data' }
  it { should be_readable.by 'owner' }
end
