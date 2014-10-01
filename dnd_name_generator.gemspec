# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dnd_name_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "dnd_name_generator"
  spec.version       = DndNameGenerator::VERSION
  spec.authors       = ["Billy Reisinger"]
  spec.email         = ["billy.reisinger@govdelivery.com"]
  spec.summary       = %q{A utility to generate an AD&D character name using your Bash history.}
  spec.description   = %q{A good utility to generate an AD&D character name using your Bash history.}
  spec.homepage      = "https://github.com/unclebilly/dnd_name_generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
end
