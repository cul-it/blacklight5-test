$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'bundler/setup'
require 'rspec'
require 'rspec/autorun'

require 'rubygems'
require 'confstruct'

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  
end
