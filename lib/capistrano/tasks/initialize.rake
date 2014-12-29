require 'yaml'

namespace :vars do

  desc 'merge variables'
  task :merge do
    on roles(:all) do |host|
      #p host.fetch(:ntp_servers)
      vars = fetch(:default_vars).clone
      vars.each {|k,v| host.properties.set(k,v) unless host.fetch(k)}
    end
  end

  desc 'export variables to file'
  task :export do
    on roles(:all) do |host|
      vars = {}
      host.properties.keys.each {|k| vars[k] = host.fetch(k)}
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
        execute :rm, f if File.exists?(f)
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
