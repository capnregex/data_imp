# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "data_imp/version"

files = `git ls-files -- lib/data_imp/tds*`.split("\n")
specs = `git ls-files -- spec/tds*`.split("\n")

Gem::Specification.new do |spec|
  spec.name          = "data_imp-tds"
  spec.version       = DataImp::VERSION
  spec.authors       = ["Robert W. Ferney"]
  spec.email         = ["rob@ferney.org"]

  spec.summary       = %q{data_imp using tiny_tds gem}
  spec.homepage      = "https://github.com/capnregex/data_imp"
  spec.license       = "MIT"

  spec.files         = files
  spec.test_files    = specs
  spec.require_paths = ["lib"]

  spec.add_dependency 'data_imp', DataImp::VERSION
  spec.add_dependency 'tiny_tds', '~> 2.1'
end
