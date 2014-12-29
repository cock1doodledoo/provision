package 'ttf-japanese-gothic'
package 'zabbix-frontend-php'

service 'apache2'

execute 'configure timezone' do
  command 'sed -i "s/# php_value date.timezone Europe\/Riga/php_value date.timezone Asia\/Tokyo/g" /etc/zabbix/apache.conf'
  notifies :restart, 'service[apache2]'
end

template '/etc/zabbix/web/zabbix.conf.php' do
  source 'zabbix.conf.php.erb'
  owner 'www-data'
  group 'www-data'
  mode '644'
  variables(
    user: node[:zbx_user],
    pass: node[:zbx_pass],
    db: node[:zbx_db],
    )
end

execute 'configure hosts' do
  command "sed -i 's/^127\.0\.1\.1.*$/127.0.1.1 #{node[:zbx_server]} #{node[:zbx_server].split(".").first}/g' /etc/hosts"
end

remote_file '/var/www/html/phpinfo.php' do
  source 'phpinfo.php'
  owner 'www-data'
  group 'www-data'
  mode '644'
end
