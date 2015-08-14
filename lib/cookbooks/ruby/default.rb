node.validate! do
  {
    ruby_version: string
  }
end

HOME = ENV['HOME']
HOME.freeze

package 'libssl-dev'
package 'libreadline-dev'
package 'libffi-dev'

git "#{HOME}/.rbenv" do
  repository 'https://github.com/sstephenson/rbenv.git'
end

remote_file "#{HOME}/.bashrc.d/rbenv.sh" do
  mode '664'
end

directory "#{HOME}/.rbenv/plugins" do
  mode '775'
end

git "#{HOME}/.rbenv/plugins/ruby-build" do
  repository 'https://github.com/sstephenson/ruby-build.git'
end

git "#{HOME}/.rbenv/plugins/default-gems" do
  repository 'https://github.com/sstephenson/rbenv-default-gems.git'
end

remote_file "#{HOME}/.rbenv/default-gems" do
  mode '664'
end

remote_file "#{HOME}/.gemrc" do
  mode '664'
end

remote_file "#{HOME}/.rspec" do
  mode '664'
end

execute 'install ruby' do
  command "env PATH=$HOME/.rbenv/bin:$PATH \
            rbenv install #{node[:ruby_version]}"
  not_if "env PATH=$HOME/.rbenv/bin:$PATH \
            rbenv versions | grep -q #{node[:ruby_version]}"
end

execute 'enable ruby' do
  command "env PATH=$HOME/.rbenv/bin:$PATH \
            rbenv global #{node[:ruby_version]}"
  not_if "env PATH=$HOME/.rbenv/bin:$PATH \
            rbenv version | grep -q #{node[:ruby_version]}"
end
