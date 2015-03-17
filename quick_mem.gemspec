# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quick_mem/version'

Gem::Specification.new do |spec|
  spec.name          = "quick_mem"
  spec.version       = QuickMem::VERSION
  spec.authors       = ["Rajiv Nair"]
  spec.email         = ["rajivrnair@gmail.com"]
  spec.summary       = %q{Quickly look at GC stats}
  spec.description   = %q{A simple gem to dump memory stats}
  spec.homepage      = "https://github.com/rajivrnair/quick_mem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~>3.1.0'
end

# group :test do
#   gem 'rspec', '3.1.0'
#   gem 'json_spec', '1.1.2'
#   gem 'shoulda-matchers', '2.6.1'
#   gem 'webmock', '1.17.4'
#   gem 'rubocop', '0.19.1', require: false
#   gem 'timecop', '0.7.1'
#   gem 'capybara', '2.3.0'
#   gem 'cane', '2.6.1'
#   gem 'reek', '1.3.6'
#   gem 'flay', '2.4.0'
#   gem 'flog', '4.2.0'
#   gem 'simplecov', '~> 0.7.1'
#   gem 'rack-test', '0.6.2', require: 'rack/test'
#   gem 'faker', '1.3.0'
# end