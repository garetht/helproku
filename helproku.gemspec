# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'helproku/version'

Gem::Specification.new do |spec|
  spec.name          = "helproku"
  spec.version       = Helproku::VERSION
  spec.authors       = ["Gareth Tan"]
  spec.email         = ["garethwtan@gmail.com"]
  spec.description   = %q{Helps you set up a Rails app with Heroku.}
  spec.summary       = %q{Initializes a Rails app for you, sets up Github, and creates a Heroku repository.}
  spec.homepage      = ""
  spec.license       = "Custom"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
