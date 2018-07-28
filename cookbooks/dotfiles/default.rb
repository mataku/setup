%w(.atom .config src).each do |dir|
  execute 'Create config dir' do
    command "mkdir -p ~/#{dir}"
  end
end

git File.expand_path('~/src/github.com/dotfiles') do
  repository 'https://github.com/mataku/dotfiles.git'
end

execute 'Create symbolic links' do
  command '/bin/bash ~/src/github.com/dotfiles/install.sh'
end
