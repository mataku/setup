%w(.atom .config github.com).each do |dir|
  execute 'Create config dir' do
    command "mkdir -p ~/#{dir}"
  end
end

git File.expand_path('~/github.com/dotfiles') do
  repository 'https://github.com/mataku/dotfiles.git'
end

execute 'Create symbolic links' do
  command '/bin/bash ~/github.com/dotfiles/install.sh'
end
