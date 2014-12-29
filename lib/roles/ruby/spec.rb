require 'spec_helper'

describe command('rbenv --version') do
  let(:path) { '$HOME/.rbenv/bin:$PATH' }
  its(:stdout) { should match /^rbenv 0.4.0/ }
end

describe command('ruby --version') do
  let(:path) { '$HOME/.rbenv/shims:$PATH' }
  its(:stdout) { should match /^ruby #{property[:ruby_version]}/ }
end

describe file('.rspec') do
  it { should be_file }
  its(:content) { should match /^--color$/ }
  its(:content) { should match /^--format documentation$/ }
end

describe file('.gemrc') do
  it { should be_file }
  its(:content) { should match /^install: --no-document$/ }
  its(:content) { should match /^update: --no-document$/ }
end
