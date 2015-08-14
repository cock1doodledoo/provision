require 'yaml'

namespace :vars do
  desc 'merge variables'
  task :merge do
    on roles(:all) do |host|
      role_vars = {}
      host.roles.each do |r|
        conf = YAML.load_file("lib/roles/#{r}.yml")
        next unless conf.key?('vars')
        conf['vars'].each do |k, v|
          fail "duplicate variables: #{k}" if role_vars.key?(k) && role_vars[k] != v
          role_vars[k] = v
        end
      end
      vars = YAML.load_file('config/default_vars.yml').merge(role_vars).symbolize_keys!
      vars.each { |k, v| host.set(k, v) unless host.fetch(k) }
    end
  end

  desc 'export variables to file'
  task :export do
    on roles(:all) do |host|
      vars = {}
      host.properties.keys.each { |k| vars[k] = host.fetch(k) }
      open("/tmp/#{host}.yml", 'w') do |f|
        YAML.dump(vars, f)
      end
    end
  end

  desc 'clean variable-file'
  task :clean do
    on roles(:all) do |host|
      run_locally do
        f = "/tmp/#{host.hostname}.yml"
        execute :rm, f if File.exist?(f)
      end
    end
  end

  before :export, :merge
end

desc 'clean environment'
task :clean do
  Rake::Task.tasks.each do |t|
    t.invoke if t.name.end_with?('clean')
  end
end
