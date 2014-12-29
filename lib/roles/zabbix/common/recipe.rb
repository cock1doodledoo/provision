ZABBIX_TEMP_FILE = '/tmp/zabbix-2.2.deb'
ZABBIX_REPOSITORY_URL = 'http://repo.zabbix.com/zabbix/2.2/ubuntu'
ZABBIX_REPOSITORY_DEB = ZABBIX_REPOSITORY_URL + '/pool/main/z/zabbix-release/zabbix-release_2.2-1+trusty_all.deb'

execute 'configure apt-repository' do
  command "wget -O #{ZABBIX_TEMP_FILE} #{ZABBIX_REPOSITORY_DEB}; dpkg -i #{ZABBIX_TEMP_FILE}; rm #{ZABBIX_TEMP_FILE}"
  user 'root'
  not_if "grep -sq '#{ZABBIX_REPOSITORY_URL}' /etc/apt/sources.list.d/*"
  notifies :run, 'execute[update apt-database]', :immediately
end

execute 'update apt-database' do
  action :nothing
  command 'apt-get update'
  user 'root'
end
