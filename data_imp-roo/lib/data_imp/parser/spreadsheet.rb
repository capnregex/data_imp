require 'roo'
class DataImp::Parser::Spreadsheet < DataImp::Parser
  def options
    { }
  end

  def process_file &block
    spreadsheet = Roo::Spreadsheet.open(filename, options)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |index|
      row = spreadsheet.row(index)
      hash = [header, row].transpose.to_h
      yield hash, index
    end
  end

  def process input, &block
    raise "unable to process spreadsheet as a stream"
  end
end
