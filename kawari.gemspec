# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kawari/version'

Gem::Specification.new do |spec|
  spec.name          = 'kawari'
  spec.version       = Kawari::VERSION
  spec.authors       = ['F']
  spec.email         = ['F']
  spec.homepage      = 'http://www.github.com/'
  spec.licenses      = 'GPL-3.0'
  spec.summary       = %q{Kawari is the backend component for several auto torrent applications}
  spec.description   = %q{Kawari backend}

  spec.files         = Dir['{lib/**/*,spec/**/*,[A-Z]*}']
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'dotenv', '~> 2.5'
  spec.add_runtime_dependency 'sequel', '~> 5.13'
  spec.add_runtime_dependency 'sequel_pg', '~> 1.11'
  spec.add_runtime_dependency 'nokogiri', '~> 1.8'
  spec.add_runtime_dependency 'rest-client', '~> 2.0'
  spec.add_runtime_dependency 'json', '~> 2.1'
  spec.add_runtime_dependency 'bunny', '~> 2.12'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.3'
end
