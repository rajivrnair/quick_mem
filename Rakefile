require "bundler/gem_tasks"
require 'rubocop/rake_task'

Dir.glob('tasks/**/*.rake').each(&method(:import))

desc 'Run RuboCop - config in .rubocop.yml'
Rubocop::RakeTask.new(:rubocop)

task :default => :spec