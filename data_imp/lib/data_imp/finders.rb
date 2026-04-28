require_relative "parser"
require_relative "porter"
require_relative "importer"

module DataImp::Finders
  def self.extended(mod)
    mod.delegate :find_parser, :find_importer, to: :class
  end

  def self.included(mod)
    mod.delegate :const_get, to: :class
  end

  def find_parser type
    return type if type.kind_of? DataImp::Parser
    type = type.to_s.camelize
    const_get "#{type}Parser"
  rescue NameError => e
    DataImp::Parser.find_parser type
  end

  def find_importer type
    return type if type.kind_of? DataImp::Porter
    type = type.to_s.camelize
    const_get "#{type}Importer"
  rescue NameError => e
    DataImp::Porter.find_importer type
  end
end
