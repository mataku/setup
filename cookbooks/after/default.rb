require 'yaml'

node['gui']['packages'].each do |app|
  execute 'List GUI applications to install' do
    command "echo #{app}"
  end
end
