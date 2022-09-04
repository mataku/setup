execute 'Install homebrew' do
  command '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  not_if { 'test -x /usr/local/bin/brew' || 'test -x /opt/homebrew/bin/brew' }
end

execute 'Install dependencies' do
  brew_command = if `uname -m` == 'arm64'
                   '/opt/homebrew/bin/brew'
                 else
                   '/usr/local/bin/brew'
                 end
  command "#{brew_command} bundle"
end

execute 'Install dependencies via mas' do
  command 'brew bundle --file=Brewfile.mas'
  not_if { ENV['CI'] == "true" }
end

execute 'Prepare Google Chrome settings dir for Vivaldi 1Password extension' do
  command 'mkdir -p ~/Library/Application\ Support/Google/Chrome/'
end
