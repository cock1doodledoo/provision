package 'fonts-mona'
package 'zabbix-frontend-php'

service 'apache2'

execute 'configure timezone' do
  command 'sed -i "s/# php_value date.timezone Europe\/Riga/php_value date.timezone Asia\/Tokyo/g" /etc/zabbix/apache.conf'
  notifies :restart, 'service[apache2]'
  not_if 'grep -sq "php_value date.timezone Asia\/Tokyo" /etc/zabbix/apache.conf'
end

template '/etc/zabbix/web/zabbix.conf.php' do
  owner 'www-data'
  group 'www-data'
  mode '644'
  variables(
    user: node[:zabbix_user],
    pass: node[:zabbix_password],
    db: node[:zabbix_database],
    )
end

execute 'configure hosts' do
  command "sed -i \'s/^127\.0\.1\.1.*$/127.0.1.1 #{node[:zabbix_hostname]} #{node[:zabbix_hostname].split(".").first}/g\' /etc/hosts"
end

remote_file '/var/www/html/phpinfo.php' do
  owner 'www-data'
  group 'www-data'
  mode '644'
end
