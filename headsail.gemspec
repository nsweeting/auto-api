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
  spec.homepage      = "https://github.com/nsweeting/headsail"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = %w( headsail )
  spec.require_paths = %w( lib )

  spec.add_runtime_dependency "redis", "~> 3.3"
  spec.add_runtime_dependency "concurrent-ruby", "~> 1.0"
  spec.add_runtime_dependency "oauth", "~> 0.5"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "byebug", "~> 5.0"
end
