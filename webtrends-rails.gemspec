# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webtrends/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "webtrends-rails"
  spec.version       = Webtrends::Rails::VERSION
  spec.authors       = ["Michael van den Beuken", "Ruben Estevez", "Jordan Babe", "Mathieu Gilbert", "Ryan Jones", "Darko Dosenovic"]
  spec.email         = ["michael.beuken@gmail.com", "ruben.a.estevez@gmail.com", "jorbabe@gmail.com", "mathieu.gilbert@ama.ab.ca", "ryan.michael.jones@gmail.com", "darko.dosenovic@ama.ab.ca"]
  spec.description   = "Make use of Webtrends gem to allow server-side tracking in a Rails application."
  spec.summary       = "Make use of Webtrends gem to allow server-side tracking in a Rails application."
  spec.homepage      = "https://github.com/amaabca/webtrends-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rspec-instafail"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "decent_exposure"
  spec.add_dependency "rails", ">= 3.1"
  spec.add_dependency "webtrends"
end