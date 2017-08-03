class Importer::Parser
  attr_accessor :filename, :importer
  def initialize(filename, importer)
    @filename = filename
    @importer = importer
  end

  def parse_file
    raise "Override Method: #{self.class}#parse_file"
  end

  def import
    print "Importing #{filename.basename} with #{importer}"
    importer.before_all_imports
    parse_file
    importer.after_all_imports
    puts
  end

  def import_row(row, i)
    row = importer[row]
    row.before_import
    row.import
    row.after_import
    puts if i % 10_000 == 0
    print '.' if i % 100 == 0
  rescue ActiveRecord::RecordInvalid => e
    puts
    puts "#{filename}:#{i}: Invalid Record: #{e} #{row}"
  end
end
