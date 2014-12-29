remote_file '/etc/profile.d/terminal-logging.sh' do
  source 'terminal-logging.sh'
  owner 'root'
  group 'root'
  mode '644'
end
