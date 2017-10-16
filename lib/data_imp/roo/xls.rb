require_relative 'spreadsheet'
require 'roo-xls'
class DataImp::Roo::Xls < DataImp::Roo::Spreadsheet
  def options
    { extension: "xls"}
  end
end
