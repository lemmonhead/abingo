# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.authors       = ["Andrew Lemmons"]
  spec.email         = ["andrew@lemmonhead.com"]
  spec.description   = %q{A split testing framework for Rails 4.x.x}
  spec.summary       = %q{The ABingo split testing framework for Rails 4.x.x from Patrick McKenzie}
  spec.homepage      = "https://github.com/lemmonhead/abingo"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "abingo"
  spec.require_paths = ["lib"]
  spec.version       = "4.0.0"

  spec.add_dependency "rails", "~> 4.0"
  spec.add_development_dependency "rake", "0.8.7"
end
