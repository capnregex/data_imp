
require 'active_support/core_ext/string'

class DataImp
end

require_relative "data_imp/finders"
require_relative "data_imp/dir"
require_relative "data_imp/import_methods"
require_relative "data_imp/class_methods"

# Dir[File.dirname(__FILE__) + '/data_imp/*.rb'].each {|file| require file }
class DataImp
  extend DataImp::Finders
  extend DataImp::Dir
  extend DataImp::ImportMethods
  extend DataImp::ClassMethods
  attr_accessor :file, :parser, :importer, :extname, :basename

  def initialize file = nil, parser: nil, importer: nil
    self.file = data_dir.join(file)
    extname = File.extname(file)
    self.basename ||= File.basename(file, extname)
    self.extname  = extname = extname.downcase.sub('.','')
    self.importer = find_importer(importer || basename) # returns class
    self.parser   = find_parser(parser || extname) # returns class
  end

  def import
    puts "Importing #{basename} with #{importer}"
    importer.before_all_imports
    parser.new(file).process_file do |hash, index|
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
    importer.after_all_imports
    puts
  end

  def show_progress index
    puts if index % 10_000 == 0
    print '.' if index % 100 == 0
  end

end

