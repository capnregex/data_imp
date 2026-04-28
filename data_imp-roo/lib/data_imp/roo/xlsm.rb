require_relative 'spreadsheet'
class DataImp::Roo::Xlsm < DataImp::Roo::Spreadsheet
  def options
    { extension: :xlsm }
  end
end
