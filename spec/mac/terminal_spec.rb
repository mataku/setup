require 'spec_helper'

describe command 'defaults read -g KeyRepeat' do
  its(:stdout) { is_expected.to eq "2\n" }
end

describe command 'defaults read -g InitialKeyRepeat' do
  its(:stdout) { is_expected.to eq "15\n" }
end


