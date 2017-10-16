
require_relative 'spreadsheet'
class DataImp::Parser::Ods < DataImp::Parser::Spreadsheet
  def roo_options
    { extension: "ods"}
  end
end
