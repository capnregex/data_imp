require_relative 'spreadsheet'
require 'roo-xls'
class DataImp::Parser::Xls < DataImp::Parser::Spreadsheet
  def options
    { extension: "xls"}
  end
end
