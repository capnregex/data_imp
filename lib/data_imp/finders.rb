
require_relative "parser"
require_relative "importer"
require_relative "porter"

class DataImp
  module Finders
    def self.extended(mod)
      mod.delegate :find_parser, :find_importer, to: :class
    end

    def self.included(mod)
      mod.delegate :const_get, to: :class
    end

    def find_parser type
      DataImp::Parser.find type
    end

    def find_importer type
      DataImp::Importer.find type
    end
  end
  extend Finders
end
