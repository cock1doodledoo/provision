require 'spec_helper'

describe file('/etc/profile.d/terminal-logging.sh') do
  it { should be_file }
end
