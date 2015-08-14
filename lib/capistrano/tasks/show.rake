require 'yaml'

namespace :show do
  desc 'show servers'
  task :servers do
    on roles(:all) do |host|
      info "#{host.user}@#{host.hostname}"
    end
  end

  desc 'show variables'
  task :vars do
    on roles(:all) do |host|
      vars = YAML.load(open("/tmp/#{host.hostname}.yml"))
      vars.each_key { |k| info "#{host.user}@#{host.hostname} - #{k} : #{vars[k]}" }
    end
  end
end

before :'show:vars', :'vars:export'
