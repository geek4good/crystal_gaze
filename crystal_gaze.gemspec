# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crystal_gaze/version'

Gem::Specification.new do |spec|
  spec.name          = "crystal_gaze"
  spec.version       = CrystalGaze::VERSION
  spec.authors       = ["Lucas Mbiwe"]
  spec.email         = ["lucas@geek4good.com"]
  spec.summary       = %q{Predict about anything – except maybe the future.}
  spec.description   = %q{Predict stuff by gazing into a crystal ball, contacting the spirit world and all that jazz.}
  spec.homepage      = "https://github.com/geek4good/crystal_gaze"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
