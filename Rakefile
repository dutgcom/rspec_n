require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  exec "pry -r rspec_n -I ./lib"
  # exec "irb -r rubocop_plus -I ./lib"
end