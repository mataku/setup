execute 'Key repeat settings' do
  command 'defaults write -g KeyRepeat -int 2'
  command 'defaults write -g InitialKeyRepeat -int 15'
end
