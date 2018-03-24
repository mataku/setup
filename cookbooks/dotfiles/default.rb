git File.expand_path('~/dotfiles') do
  repository 'https://github.com/mataku/dotfiles.git'
end

execute 'Create symbolic links' do
  command '/bin/bash ~/dotfiles/install.sh'
end
