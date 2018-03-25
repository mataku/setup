require 'spec_helper'

describe file File.expand_path('github.com/dotfiles', '~') do
  it { is_expected.to be_directory }
end

%w(.vim .emacs.d .config/fish .config/fish/functions .config/powerline .atom).each do |dir|
  describe file File.expand_path(dir, '~') do
    it { is_expected.to be_directory }
  end
end

%w(.gitconfig .vimrc .zshrc .tmux.conf .config/fish/config.fish).each do |file|
  describe file File.expand_path(file, '~') do
    it { is_expected.to be_file }
  end
end
