# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fucktherubyracer/version'

Gem::Specification.new do |spec|
  spec.name          = 'fucktherubyracer'
  spec.version       = Fucktherubyracer::VERSION
  spec.authors       = ['Alexander Semyonov']
  spec.email         = ['al@semyonov.us']

  spec.summary       = 'Fucks uninstallable TheRubyRacer gem.'
  spec.description   = 'In order to work on some app you don’t have to fuck with uninstallable shit that should not be used at all.'
  spec.homepage      = 'http://alsemyonov.github.com/fucktherubyracer/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'bundler', '~> 1.10'
  spec.add_runtime_dependency 'erubis'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
