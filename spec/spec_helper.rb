require 'bundler/setup'
require 'english'

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

Bundler.require :default, :test
