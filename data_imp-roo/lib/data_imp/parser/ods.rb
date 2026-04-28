
require_relative 'spreadsheet'
class DataImp::Parser::Ods < DataImp::Parser::Spreadsheet
  def options
    { extension: "ods"}
  end
end
