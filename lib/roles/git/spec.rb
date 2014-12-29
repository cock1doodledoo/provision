require 'spec_helper'

describe package('git') do
  it { should be_installed }
end

describe command('git --version') do
  its(:stdout) { should match /git version 1.9.1/ }
end

describe command('git config --list --global') do
  its(:stdout) { should match /^user\.name=#{property[:git_user_name]}/ }
  its(:stdout) { should match /^user\.email=#{property[:git_user_email]}/ }
end
