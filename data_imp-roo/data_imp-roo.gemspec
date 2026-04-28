lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_imp/version'

core_gemspec = Gem::Specification.load(File.expand_path('../data_imp/data_imp.gemspec', __dir__))

files = `git ls-files -- lib/data_imp/roo*`.split("\n")
specs = `git ls-files -- spec/roo*`.split("\n")

Gem::Specification.new do |spec|
  spec.name          = 'data_imp-roo'
  spec.version       = DataImp::VERSION
  spec.authors       = core_gemspec.authors
  spec.email         = core_gemspec.email

  spec.summary       = 'data_imp using roo gem'
  spec.homepage      = 'https://github.com/capnregex/data_imp'
  spec.license       = 'MIT'

  spec.files         = files
  spec.test_files    = specs
  spec.require_paths = ['lib']

  spec.add_dependency 'data_imp', DataImp::VERSION
  spec.add_dependency 'roo'
  spec.add_dependency 'roo-xls'
end
