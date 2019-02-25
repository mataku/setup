require 'spec_helper'

describe file '/usr/local/bin/brew' do
  it { is_expected.to be_file }
  it { is_expected.to be_executable }
end

describe file '/usr/local/bin/emacs' do
  it { is_expected.to be_file }
  it { is_expected.to be_executable }
end
