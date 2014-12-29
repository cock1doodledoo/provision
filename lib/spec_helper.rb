require 'serverspec'
require 'net/ssh'
require 'yaml'

set :backend, :ssh

host = ENV['TARGET_HOST']

include Specinfra::Helper::Properties
set_property YAML.load_file("/tmp/#{host}.yml")

options = Net::SSH::Config.for(host)
options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options
set :disable_sudo, true
