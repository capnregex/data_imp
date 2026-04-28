require_relative "finders"
require_relative "options"
require_relative "import"
class DataImp
  class Base
    include DataImp::Options
    extend DataImp::Finders
    include DataImp::Import
    extend DataImp::Import
  end
end
