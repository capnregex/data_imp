
require 'active_support/all'

require_relative "data_imp/version"
require_relative "data_imp/finders"
require_relative "data_imp/options"
require_relative "data_imp/dir"
require_relative "data_imp/import"

class DataImp
  include DataImp::Options
  extend DataImp::Finders
  extend DataImp::Import
  include DataImp::Import
  extend DataImp::Dir
end

