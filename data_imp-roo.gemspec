# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "data_imp/version"

files = `git ls-files -z -- lib/data_imp/roo`.split("\x0")

Gem::Specification.new do |spec|
  spec.name          = "data_imp-roo"
  spec.version       = DataImp::VERSION
  spec.authors       = ["Robert W. Ferney"]
  spec.email         = ["rob@ferney.org"]

  spec.summary       = %q{data_imp using roo gem}
  spec.homepage      = "https://github.com/capnregex/data_imp"
  spec.license       = "MIT"

  spec.files         = files
  spec.require_paths = ["lib"]

  spec.add_dependency 'roo', '~> 2.0'
  spec.add_dependency 'data_imp', DataImp::VERSION
end
