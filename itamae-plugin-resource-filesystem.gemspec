# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'itamae-plugin-resource-filesystem'
  spec.version       = '0.0.1'
  spec.authors       = ['Satoshi Matsumoto']
  spec.email         = ['kaorimatz@gmail.com']
  spec.summary       = %q{Itamae resource plugin to create filesystem.}
  spec.description   = %q{Itamae resource plugin to create filesystem.}
  spec.homepage      = 'https://github.com/kaorimatz/itamae-plugin-resource-filesystem'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'itamae'
end
