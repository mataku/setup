require 'rake'
require "rspec/core/rake_task"

task spec: 'spec:all'
task default: :spec

namespace :spec do
  desc "Run serverspec tests"
  os = `uname`.downcase!.chomp!

  RSpec::Core::RakeTask.new('all') do |t|
    t.pattern = if os == 'darwin'
                  'spec/mac/*_spec.rb'
                else
                  ""
                end
  end
end
