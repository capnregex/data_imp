# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "data_imp/version"

plugins = Dir['data_imp-*.gemspec'].map { |g| eval(File.read(g)) }
plugin_files = plugins.map { |p| p.files }.flatten.uniq
plugin_test_files = plugins.map { |p| p.test_files }.flatten.uniq
files = `git ls-files -- lib`.split("\n") - plugin_files
specs = `git ls-files -- spec`.split("\n") - plugin_test_files
bins = `git ls-files -- bin`.split("\n").map{ |f| File.basename(f) }

Gem::Specification.new do |spec|
  spec.name          = "data_imp"
  spec.version       = DataImp::VERSION
  spec.authors       = ["Robert W. Ferney"]
  spec.email         = ["rob@ferney.org"]

  spec.summary       = %q{Scaffolding to make importing data easy}
  spec.homepage      = "https://github.com/capnregex/data_imp"
  spec.license       = "MIT"

  spec.files         = files
  spec.test_files    = specs
  spec.executables   = bins
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', "~> 5"
end
