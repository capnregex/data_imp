require 'csv'
class DataImp::Parser::Csv < DataImp::Parser
  def options
    { headers: true }
  end

  def process input
    csv = CSV.new(input, options)
    index = 1
    csv.each do |row|
      yield row, index
      ++index
    end
  end
end
