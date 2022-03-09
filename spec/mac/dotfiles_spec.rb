require 'spec_helper'

describe file File.expand_path('src/github.com/mataku/dotfiles', '~') do
  it { is_expected.to be_directory }
end

%w(.vim .emacs.d .config/fish .config/fish/functions).each do |dir|
  describe file File.expand_path(dir, '~') do
    it { is_expected.to be_directory }
  end
end

%w(.gitconfig .vimrc .config/fish/config.fish).each do |file|
  describe file File.expand_path(file, '~') do
    it { is_expected.to be_file }
  end
end
