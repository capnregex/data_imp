require 'roo'
require 'tempfile'
 
class DataImp::Parser::Spreadsheet < DataImp::Parser
  def roo_options
    { }
  end

  def process_file &block
    spreadsheet = Roo::Spreadsheet.open(filename, roo_options)
    process_spreadsheet(spreadsheet, &block)
  end

  def process_blob &block
    file = Tempfile.new('tempfile')
    begin
      file.write(blob)
      file.rewind
      spreadsheet = Roo::Spreadsheet.open(file, roo_options)
      process_spreadsheet(spreadsheet, &block)
    ensure
      file.close
      file.unlink
    end
  end

  def process_spreadsheet(spreadsheet, &block)
    header = spreadsheet.row(1).map { |key| key.to_s.strip.gsub(/\s+/,'_').downcase }
    (2..spreadsheet.last_row).each do |index|
      row = spreadsheet.row(index)
      hash = [header, row].transpose.to_h
      block.call(hash, index)
    end
  end

  def process input, &block
    raise "unable to process spreadsheet as a stream"
  end
end
