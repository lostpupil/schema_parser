# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'schema_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "schema_parser"
  spec.version       = SchemaParser::VERSION
  spec.authors       = ["banana"]
  spec.email         = ["banana@eurus.cn"]

  spec.summary       = %q{This is a simple schema parser}
  spec.description   = %q{This is a simple schema parser to convert specifed schema.txt to dot file}
  spec.homepage      = "https://github.com/lostpupil/schema_parser"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
