namespace :tunnel do

  desc 'create tunnel'
  task :create => ['ssh:bind', 'apt:configure', 'wget:configure']

  desc 'delete tunnel'
  task :delete => ['ssh:unbind', 'apt:unconfigure', 'wget:unconfigure']

  namespace :ssh do

    desc 'bind ssh tunnel'
    task :bind do
      on roles(:all) do |host|
        # TODO:サブプロセスをjoin待ちしているところでハングしているっぽい
        #execute "ssh -fN -R 8080:localhost:3128 #{host.user}@#{host.hostname}"
        info "creating remote ssh connection to #{host.user}@#{host.hostname}"
        spawn("ssh -fN -R 8080:localhost:3128 #{host.user}@#{host.hostname}")
      end
    end

    desc 'unbind ssh tunnel'
    task :unbind do
      on roles(:all) do |host|
        run_locally do
          proc = capture "ps ax | grep \"ssh -fN -R 8080:localhost:3128 #{host.user}@#{host.hostname}\"| head -1"
          execute :kill, proc.strip.split(' ').first
        end
      end
    end

  end

  namespace :apt do

    desc 'configure apt to use the proxy temporally'
    task :configure do
      on roles(:all) do |host|
        upload! 'lib/capistrano/tasks/99proxy', '/tmp'
        within '/tmp' do
          execute :sudo, :chown, 'root:root', '99proxy'
          execute :sudo, :mv, '99proxy', '/etc/apt/apt.conf.d/'
        end
      end
    end

    desc 'unconfigure apt'
    task :unconfigure do
      on roles(:all) do |host|
        execute :sudo, :rm, '/etc/apt/apt.conf.d/99proxy'
      end
    end

  end

  namespace :wget do

    desc 'configure wget to use the proxy temporally'
    task :configure do
      on roles(:all) do |host|
        execute :sudo, :sh, '-c', '"echo http_proxy=http://localhost:8080/ >> /etc/wgetrc"'
      end
    end

    desc 'unconfigure wget'
    task :unconfigure do
      on roles(:all) do |host|
        execute :sudo, :sed, '-i', '/^http_proxy.*$/d', '/etc/wgetrc'
      end
    end

  end

end
