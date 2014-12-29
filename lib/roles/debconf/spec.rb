require 'spec_helper'

describe package('debconf-utils') do
  it { should be_installed }
end
