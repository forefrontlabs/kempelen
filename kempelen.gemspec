# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kempelen/version'

Gem::Specification.new do |spec|
  spec.name          = "kempelen"
  spec.version       = Kempelen::VERSION
  spec.authors       = ["Brian Nelson"]
  spec.email         = ["brian@forefrontlabs.com"]

  spec.summary       = %q{Ruby integration with Amazon's Mechanical Turk}
  spec.description   = %q{Modern Ruby integration with Amazon's Mechanical Turk.}
  spec.homepage      = "https://github.com/forefrontlabs/kempelen"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-hmac", "~> 0.4.0"
  spec.add_dependency "nori", "~> 2.6.0"
  spec.add_dependency "httparty", "~> 0.13.6"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.0.20"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "coveralls"
end
