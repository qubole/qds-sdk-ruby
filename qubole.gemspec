# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qubole/version'

Gem::Specification.new do |spec|
  spec.name          = "qubole"
  spec.version       = Qubole::VERSION
  spec.authors       = ["Volodymyr Ladnik"]
  spec.email         = ["vladnik@demandbase.com"]
  spec.summary       = %q{Qubole REST API client}
  spec.description   = %q{Communication with Qubole REST API in a Ruby way}
  spec.homepage      = "https://github.com/Demandbase/qubole-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
end
