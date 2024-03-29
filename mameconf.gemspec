# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mameconf/version'

Gem::Specification.new do |spec|
  spec.name          = "mameconf"
  spec.version       = Mameconf::VERSION
  spec.authors       = ["sutetotanuki"]
  spec.email         = ["sutetotanuki@gmail.com"]
  spec.description   = %q{mame config}
  spec.summary       = %q{mame config}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "growl"
  spec.add_development_dependency "rb-fsevent"
end
