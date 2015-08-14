require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

desc 'run serverspec'
task :serverspec do
  on roles(:all), in: :sequence do |host|
    RSpec::Core::RakeTask.new(host.hostname) do |t|
      ENV['TARGET_HOST'] = host.hostname
      roles = host.roles.map do |r|
        YAML.load_file("lib/roles/#{r}.yml")['cookbooks']
      end.flatten.uniq
      t.pattern = "lib/cookbooks/{#{roles.join(',')}}/spec.rb,"\
                  "lib/nodes/#{host.hostname}/spec.rb"
    end
    Rake::Task[host.hostname].invoke
  end
end

before :serverspec, :'vars:export'
