include_recipe "../cookbooks/dependency/#{`uname`.chomp.downcase}"
include_recipe '../cookbooks/dotfiles/default'

if `uname` == 'Darwin'
  include_recipe '../cookbooks/terminal/default'
  include_recipe '../cookbooks/font/default'
end
