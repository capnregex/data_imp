require 'roo'
class Importer::Xls < Importer::Parser
  def options
    { extension: :xls }
  end

  def parse_file
    spreadsheet = Roo::Spreadsheet.open(filename, options)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose
      import_row(row, i)
    end
  end
end
