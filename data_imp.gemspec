# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "data_imp/version"

# plugin_files = Dir['data_imp-*.gemspec'].map { |gemspec|
#   eval(File.read(gemspec)).files
# }.flatten.uniq

files = `git ls-files -z`.split("\x0").reject do |f|
  f.match(%r{^(test|spec|features|data)/})
end

Gem::Specification.new do |spec|
  spec.name          = "data_imp"
  spec.version       = DataImp::VERSION
  spec.authors       = ["Robert W. Ferney"]
  spec.email         = ["rob@ferney.org"]

  spec.summary       = %q{Scaffolding to make importing data easy}
  spec.homepage      = "https://github.com/capnregex/data_imp"
  spec.license       = "MIT"

  spec.files         = files # - plugin_files
  spec.test_files    = `git ls-files -- spec`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', "~> 6.0"
  spec.add_dependency 'roo', '~> 2.0'
  spec.add_dependency 'roo-xls', '~> 1.2'
end
