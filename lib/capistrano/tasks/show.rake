namespace :show do

  desc 'show servers'
  task :servers do
    on roles(:all) do |host|
      info "#{host.user}@#{host.hostname}"
    end
  end

end
