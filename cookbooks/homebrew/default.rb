require 'yaml'

execute 'Install homebrew' do
  command '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
end

node['homebrew']['repositories'].each do |repo|
  execute 'Tap repositories' do
    command "brew tap #{repo}"
  end
end

node['homebrew']['packages'].each do |package|
  execute 'Install packages' do
    command "brew install #{package}"
  end
end

node['homebrew']['cask_packages'].each do |package|
  execute 'Install packages via cask' do
    command "brew cask install #{package}"
  end
end
