require_relative 'spreadsheet'
class DataImp::Parser::Xlsx < DataImp::Parser::Spreadsheet
  def roo_options
    { extension: :xlsx }
  end
end
