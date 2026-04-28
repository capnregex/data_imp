require_relative 'spreadsheet'
class DataImp::Roo::Csv < DataImp::Roo::Spreadsheet
  def options
    { extension: :csv }
  end
end
