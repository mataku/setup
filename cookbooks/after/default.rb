require 'yaml'

execute 'Install terminal-notifier' do
  command 'gem i terminal-notifier --no-doc'
end

node['gui']['packages'].each do |app|
  execute 'List GUI applications to install' do
    command "echo #{app}"
  end
end
