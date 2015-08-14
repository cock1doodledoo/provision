node.validate! do
  {
    apt_upgrade: boolean
  }
end

execute 'apt-get update' do
  user 'root'
end

execute 'apt-get -y upgrade' do
  user 'root'
  only_if node[:apt_upgrade]
end
