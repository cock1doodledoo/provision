require 'yaml'

# config valid only for Capistrano 3.3
lock '3.3.5'

set :pty, true

# default variables
set :default_vars, YAML.load_file('config/default_vars.yml').each_with_object({}){|(k,v),memo| memo[k.to_s.to_sym]=v}
