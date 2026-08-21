
class DataImp
end

require 'active_support'
require 'active_support/all'
require 'csv'
require 'yaml'
require 'json'

require_relative "data_imp/version"
require_relative "data_imp/options"

require_relative "data_imp/import"

require_relative "data_imp/finders"
require_relative "data_imp/dir"
require_relative "data_imp/import_methods"
require_relative "data_imp/class_methods"

class DataImp
  extend DataImp::Finders
  extend DataImp::Dir
  extend DataImp::ImportMethods
  extend DataImp::ClassMethods
  attr_accessor :file, :parser, :importer, :extname, :basename

  def initialize file = nil, parser: nil, importer: nil
    return unless file

    @file = data_dir.join(file)
    extname = File.extname(file)
    @basename ||= File.basename(file, extname)
    @extname  = extname.downcase.sub('.','')
    @importer = find_importer(importer || @basename) # returns class
    @parser   = find_parser(parser || @extname) # returns class
  end

  def import
    puts "Importing #{basename} with #{importer}"
    importer.before_all_imports
    parser.new(file).process_file do |hash, index|
      porter = importer.new(hash, index)
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
    importer.after_all_imports
    puts
  end

  def show_progress index
    puts if index % 10_000 == 0
    print '.' if index % 100 == 0
  end
end

