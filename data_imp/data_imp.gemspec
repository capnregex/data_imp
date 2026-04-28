# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "data_imp/version"

files = `git ls-files -z -- lib/data_imp*`.split("\x0")
specs = `git ls-files -z -- spec/`.split("\x0")

Gem::Specification.new do |spec|
  spec.name          = "data_imp"
  spec.version       = DataImp::VERSION
  spec.authors       = ["Robert W. Ferney"]
  spec.email         = ["rob@ferney.org"]

  spec.summary       = %q{Scaffolding to make importing data easy}
  spec.homepage      = "https://github.com/capnregex/data_imp"
  spec.license       = "MIT"

  spec.files         = files
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "activesupport"
end
