require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

desc 'run serverspec'
task :serverspec do
  on roles(:all), in: :sequence do |host|
    RSpec::Core::RakeTask.new(host.hostname) do |t|
      ENV['TARGET_HOST'] = host.hostname
      t.pattern = "lib/roles/{#{host.roles.to_a.join(',')}}/spec.rb,lib/nodes/#{host.hostname}/spec.rb"
    end
    Rake::Task[host.hostname].invoke
  end
end

before :serverspec, :'vars:export'
