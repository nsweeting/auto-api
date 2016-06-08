# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'headsail/version'

Gem::Specification.new do |spec|
  spec.name          = "headsail"
  spec.version       = Headsail::VERSION
  spec.authors       = ["Nicholas Sweeting"]
  spec.email         = ["nsweeting@gmail.com"]
  spec.summary       = "Automated API data retrieval and storage."
  spec.description   = "Automated API data retrieval and storage."
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "lib"
  spec.executables   = ['headsail']
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "redis"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "concurrent-ruby"
  spec.add_development_dependency "oauth"
end
