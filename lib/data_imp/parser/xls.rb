require_relative 'spreadsheet'
require 'roo-xls'
class DataImp::Parser::Xls < DataImp::Parser::Spreadsheet
  def roo_options
    { extension: "xls"}
  end
end
