require 'spec_helper'

describe file '/usr/local/bin/brew' do
  it { is_expected.to be_file }
  it { is_expected.to be_executable }
end

describe command '/usr/local/bin/emacs' do
  it { is_expected.to be_file }
  it { is_expected.to be_executable }
end

describe command 'vim --version | grep +lua' do
  its(:exit_status) { is_expected.to eq 0 }
end
