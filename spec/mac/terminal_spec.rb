require 'spec_helper'

describe command 'defaults read -g KeyRepeat' do
  its(:stdout) do
    pending('Because of Travis Environment?')
    is_expected.to eq "2\n"
  end
end

describe command 'defaults read -g InitialKeyRepeat' do
  its(:stdout) do
    pending('Because of Travis Environment?')
    is_expected.to eq "15\n"
  end
end


