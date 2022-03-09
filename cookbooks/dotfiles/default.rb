%w(.config/coc/extensions src .config/mvim/rc).each do |dir|
  execute 'Create config dir' do
    command "mkdir -p ~/#{dir}"
  end
end

git File.expand_path('~/src/github.com/mataku/dotfiles') do
  repository 'https://github.com/mataku/dotfiles.git'
end

execute 'Create symbolic links' do
  command '/bin/bash ~/src/github.com/mataku/dotfiles/install.sh'
end

execute 'Install fisher' do
  command 'curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish'
  command 'echo "Execute fisher in fish shell!"'
end

execute 'Install bundletool' do
  command 'curl -sLO https://github.com/google/bundletool/releases/download/0.13.4/bundletool-all.jar -o ~/src/github.com/mataku/dotfiles/bin/bundletool.jar'
end

execute 'mkdir emacs themes dir' do
  command 'mkdir -p ~/.emacs.d/themes/'
end

git File.expand_path('~/.emacs.d/themes/material-theme') do
  repository 'https://github.com/mataku/emacs-material-theme'
end

execute 'Install coc extensions' do
  command 'cd ~/.config/coc/extensions && npm i --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod && cd -'
end
