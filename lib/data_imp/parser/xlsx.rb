require_relative 'xls'
class DataImp::Parser::Xlsx < DataImp::Parser::Xls
  def options
    { extension: :xlsx }
  end
end
