require 'yaml'

namespace :itamae do
  desc 'run itamae'
  task :run do
    on roles(:all) do |host|
      run_locally do
        execute "itamae ssh -h #{host.hostname} -u #{host.user} "\
                "-y /tmp/#{host.hostname}.yml /tmp/#{host.hostname}.rb"
      end
    end
  end

  desc 'dry-run itamae'
  task :dry_run do
    on roles(:all) do |host|
      run_locally do
        execute "itamae ssh --dry-run -h #{host.hostname} -u #{host.user} "\
                "-y /tmp/#{host.hostname}.yml /tmp/#{host.hostname}.rb"
      end
    end
  end

  desc 'create recipe for itamae'
  task :create_recipe do
    on roles(:all) do |host|
      recipes = host.roles.map do |r|
        YAML.load_file("lib/roles/#{r}.yml")['cookbooks']
      end.flatten.uniq
      recipes.map! { |b| "lib/cookbooks/#{b}/default.rb" }
      recipes << "lib/nodes/#{host.hostname}/default.rb"
      recipes.keep_if { |f| File.exist?(f) }
      open("/tmp/#{host.hostname}.rb", 'w') do |f|
        recipes.each do |r|
          f.puts "include_recipe \'#{File.expand_path(r)}\'"
        end
      end
    end
  end

  desc 'clean recipe'
  task :clean do
    on roles(:all) do |h|
      run_locally do
        f = "/tmp/#{h.hostname}.rb"
        execute :rm, f if File.exist?(f)
      end
    end
  end

  before :run, :'vars:export'
  before :run, :create_recipe
  before :dry_run, :'vars:export'
  before :dry_run, :create_recipe
end
