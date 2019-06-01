execute 'Install homebrew' do
  command '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  not_if 'test $(which /usr/local/bin/brew)'
end

execute 'Install dependencies' do
  command 'brew bundle'
  not_if { ENV['CI'] == "true" }
end

execute 'Install dependencies with debug logs' do
  command 'brew bundle --verbose'
  not_if { ENV['CI'] == "false" }
end

execute 'Install dependencies via mas' do
  command 'brew bundle --file=Brewfile.mas'
  not_if { ENV['CI'] == "false" }
end
