require 'pathname'

require_relative "parser"
require_relative "porter"

module DataImp::ClassMethods
  def self.extended(mod)
    mod.delegate :find_parser, :find_importer, to: :class
  end

  def root= dir
    @root = dir
  end

  def root
    @root ||= Pathname.new '.'
  end

  def data_dir= dir
    @data_dir = dir
  end

  def data_dir
    @data_dir ||= root.join('data')
  end

  def import(*args,&block)
    new(*args,&block).import
  end

  def import_list *args
    args.each do |arg| 
      arg.split.each do |word|
        import_file word
      end
    end
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

