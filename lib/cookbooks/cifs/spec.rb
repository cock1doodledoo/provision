require 'spec_helper'

describe package('cifs-utils') do
  it { should be_installed }
end
