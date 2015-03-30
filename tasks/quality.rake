require 'rubocop'
require 'rubocop/rake_task'

desc 'Run RuboCop - config in .rubocop.yml'
RuboCop::RakeTask.new(:rubocop)

task quality: %w(rubocop)
