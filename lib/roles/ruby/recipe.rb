package 'libssl-dev'
package 'libreadline-dev'
package 'libffi-dev'

git "#{ENV['HOME']}/.rbenv" do
  repository 'https://github.com/sstephenson/rbenv.git'
end

remote_file "#{ENV['HOME']}/.bashrc.d/rbenv.sh" do
  source 'rbenv.sh'
  mode '644'
end

directory "#{ENV['HOME']}/.rbenv/plugins" do
  mode '755'
end

git "#{ENV['HOME']}/.rbenv/plugins/ruby-build" do
  repository 'https://github.com/sstephenson/ruby-build.git'
end

git "#{ENV['HOME']}/.rbenv/plugins/default-gems" do
  repository 'https://github.com/sstephenson/rbenv-default-gems.git'
end

remote_file "#{ENV['HOME']}/.rbenv/default-gems" do
  source 'default-gems'
  mode '644'
end

remote_file "#{ENV['HOME']}/.gemrc" do
  source 'gemrc'
  mode '644'
end

remote_file "#{ENV['HOME']}/.rspec" do
  source 'rspec'
  mode '644'
end

execute 'install ruby' do
  command "env PATH=$HOME/.rbenv/bin:$PATH rbenv install --skip-existing #{node[:ruby_version]}"
end

execute 'enable ruby' do
  command "env PATH=$HOME/.rbenv/bin:$PATH rbenv global #{node[:ruby_version]}"
end
