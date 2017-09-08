require 'roo'
module DataImp::Parser::Xls < DataImp::Parser
  def options
    { extension: :xls }
  end

  def process input
    spreadsheet = Roo::Spreadsheet.open(input, options)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |index|
      row = spreadsheet.row(index)
      hash = [header, row].transpose
      yield hash, index
    end
  end
end
