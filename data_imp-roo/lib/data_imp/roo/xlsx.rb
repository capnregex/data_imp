require_relative 'spreadsheet'
class DataImp::Roo::Xlsx < DataImp::Roo::Spreadsheet
  def options
    { extension: :xlsx }
  end
end
