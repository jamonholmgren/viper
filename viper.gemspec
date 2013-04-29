# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'viper/version'

Gem::Specification.new do |spec|
  spec.name          = "viper"
  spec.version       = Viper::VERSION
  spec.authors       = ["Jamon Holmgren"]
  spec.email         = ["jamon@clearsightstudio.com"]
  spec.description   = %q{Auto snake case for Objective-C methods in RubyMotion}
  spec.summary       = %q{Auto snake case for Objective-C methods in RubyMotion}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
