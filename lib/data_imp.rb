
require 'active_support/core_ext/string'
require_relative "data_imp/version"
require_relative "data_imp/parser"
require_relative "data_imp/porter"
require_relative "data_imp/class_methods"

# Dir[File.dirname(__FILE__) + '/data_imp/*.rb'].each {|file| require file }
module DataImp
  extend DataImp::ClassMethods
  attr_accessor :reader, :parser, :importer, :extname, :basename

  def initialize source=nil, reader: nil, parser: nil, importer: nil
    self.reader = reader
    self.source = source
    source = source.to_s
    extname = File.extname(source)
    self.basename ||= File.basename(source, extname)
    self.extname  = extname.downcase.sub('.','')
    self.importer = find_importer(importer || basename) # returns class
    self.parser   = find_parser(parser || extname) # returns class
  end

  def find_parser type
    return type if type.kind_of? DataImp::Parser
    type = type.to_s.classify
    const_get "#{type}Parser"
  rescue NameError => e
    Parser.const_get type
  end

  def import
    print "Importing #{basename} with #{importer}"
    importer.before_all_imports
    reader.open do |input|
      parser.process(input) do |hash, index|
        porter = importer.new(hash,index)
        begin
          porter.before_import
          porter.import
          porter.after_import
          show_progress index
        rescue StandardError => e
          warn "#{basename}:#{index}:#{e.class.name}"
          porter.on_error e
        end
      end
    end
    importer.after_all_imports
    puts
  end

  def show_progress index
    puts if index % 10_000 == 0
    print '.' if index % 100 == 0
  end

#  def import_file filename
#
#    parser_class_name = ext.classify
#    importer_class_name = base.concat('_importer').classify
#    file = data_dir.join(filename)
#
#    begin
#      parser = const_get(parser_class_name)
#      importer = importer_class_name.constantize
#    rescue NameError => e
#      warn "No importer class: #{e}"
#      return 
#    end
#    parser.new(file, importer).import
#  end

#  def reader= reader
#    return unless reader
#    @reader = 
#      case reader
#      when IO,DataImp::Reader then reader
#      when String then open(reader)
#      when Pathname then reader.open
#      end
#  end
end

