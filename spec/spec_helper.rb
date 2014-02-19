require 'simplecov'
require 'rails/all'
require 'rspec/rails'
require 'webtrends/rails'
require 'coveralls'
require 'decent_exposure'
require 'factories/application'
require 'factories/controller'
require 'factories/model'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]