require 'bundler/setup'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

Bundler.require :default, :test
