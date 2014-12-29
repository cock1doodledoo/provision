package 'git'

template "#{ENV['HOME']}/.gitconfig" do
  source 'gitconfig.erb'
  owner 'vagrant'
  group 'vagrant'
  mode '644'
  variables(
    user_name: node[:git_user_name],
    user_email: node[:git_user_email],
    )
  not_if '[ -e $HOME/.gitconfig ]'
end
