HOMEBREW_URL = "https://raw.githubusercontent.com/Homebrew/install/master/install"

execute 'Install Homebrew' do
  command "ruby -e \"$(curl -fsSL #{HOMEBREW_URL})\""
  not_if "test $(which brew)"
end

node["brew"]["repositories"].each do |repository|
  execute "Add Repository" do
    command "brew tap #{repository}"
    not_if "brew tap | grep -q '#{repository}'"
  end
end

node["brew"]["packages"].each do |package|
  execute "Install packages" do
    if package == 'emacs'
      command "brew install -f #{package}"
    elsif package == 'git'
      command "brew install #{package} --with-brewed-curl --with-brewed-openssl"
    elsif package == 'vim'
      command "brew install #{package} --with-lua --with-python3 --override-system-vi"
    elsif package == 'zsh'
      command "brew install #{package} --without-etcdir"
    else
      command "brew install #{package}"
    end
  end
end

node["brew"]["cask_packages"].each do |package|
  execute "Install apps" do
    command "brew cask install #{package}"
  end
end
