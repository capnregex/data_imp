require_relative 'spreadsheet'
class DataImp::Parser::Xlsx < DataImp::Parser::Spreadsheet
  def options
    { extension: :xlsx }
  end
end
