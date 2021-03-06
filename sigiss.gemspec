# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sigiss/version'

Gem::Specification.new do |spec|
  spec.name          = "sigiss"
  spec.version       = Sigiss::VERSION
  spec.authors       = ["Gabriel Pereira"]
  spec.email         = ["gabrielpedepera@gmail.com"]

  spec.summary       = %q{Ruby gem para integração com o sistema SIGISS para emissão de Notas Fiscais Eletrônicas.}
  spec.description   = ""
  spec.homepage      = "https://github.com/gabrielpedepera/sigiss"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_dependency "activemodel", "~> 4.2.5"
  spec.add_dependency "savon"

end
