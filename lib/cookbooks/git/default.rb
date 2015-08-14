node.validate! do
  {
    git_user: string,
    git_email: string
  }
end

package 'git'

execute "git config --global user.name #{node[:git_user]}" do
  not_if "git config --list --global | grep -q user.name=#{node[:git_user]}"
end

execute "git config --global user.email #{node[:git_email]}" do
  not_if "git config --list --global | grep -q user.email=#{node[:git_email]}"
end
