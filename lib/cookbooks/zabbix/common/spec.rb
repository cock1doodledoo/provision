require 'spec_helper'

describe command('cat /etc/apt/sources.list.d/*') do
  its(:stdout) { should match 'http://repo.zabbix.com/zabbix/2.2/ubuntu' }
end
