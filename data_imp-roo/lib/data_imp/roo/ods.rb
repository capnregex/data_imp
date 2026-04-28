require_relative 'spreadsheet'
class DataImp::Roo::Ods < DataImp::Roo::Spreadsheet
  def options
    { extension: "ods"}
  end
end
