git File.expand_path('~/.emacs.d') do
  repository 'https://github.com/syl20bnr/spacemacs'
end

execute 'mkdir emacs themes dir' do
  command 'mkdir -p ~/.emacs.d/private/themes/'
end

git File.expand_path('~/.emacs.d/private/themes/material-theme') do
  repository 'https://github.com/mataku/emacs-material-theme'
end
