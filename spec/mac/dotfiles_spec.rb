require 'spec_helper'

describe file File.expand_path('src/github.com/dotfiles', '~') do
  it { is_expected.to be_directory }
end

%w(.vim .emacs.d .emacs.d/themes/material-theme .config/fish .config/fish/functions).each do |dir|
  describe file File.expand_path(dir, '~') do
    it { is_expected.to be_directory }
  end
end

%w(.gitconfig .vimrc .zshrc .tmux.conf .config/fish/config.fish).each do |file|
  describe file File.expand_path(file, '~') do
    it { is_expected.to be_file }
  end
end
