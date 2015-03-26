# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gradingVZ/version'

Gem::Specification.new do |spec|
  spec.name          = "gradingVZ"
  spec.version       = GradingVZ::VERSION
  spec.authors       = ["victor-zacchi"]
  spec.email         = ["victorzacchi@gmail.com"]

  spec.summary       = %q{Gem for grading quiz results}
  spec.description   = %q{This is a very simple gem created for my project}
  spec.homepage      = ""
  spec.license       = "MIT"


  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
