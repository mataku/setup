execute 'Key repeat settings' do
  command 'defaults write -g KeyRepeat -int 2'
  command 'defaults write -g InitialKeyRepeat -int 15'
end

execute 'Dock settings' do
  command 'defaults write com.apple.dock persistent-apps -array
'
  command 'defaults write com.apple.dock show-process-indicators -int 0'
end

execute 'Notify restart' do
  command 'osascript -e \'display notification "Enable mac settings after restart" with title "Itamae"\''
end
