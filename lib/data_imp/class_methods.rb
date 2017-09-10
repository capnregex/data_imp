require 'pathname'

require_relative "parser"
require_relative "porter"

module DataImp::ClassMethods
  def self.extended(mod)
    mod.delegate :data_dir, :find_parser, :find_importer, to: :class
  end

  def root= dir
    @root = dir
  end

  def root
    @root ||= Pathname.pwd
  end

  def data_dir= dir
    path = Pathname.new(dir)
    @data_dir = 
      if path.absolute?
        path
      else
        root.join(path)
      end
  end

  def data_dir
    @data_dir ||= root.join('data')
  end

  def import(file=nil,*args,&block)
    file.strip!
    return if file =~ /^#/
    new(file, *args,&block).import
  end

  def import_list *args
    args.each do |arg| 
      arg.each_line do |file|
        import file
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

