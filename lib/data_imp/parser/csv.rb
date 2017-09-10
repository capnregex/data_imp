require 'csv'
class DataImp::Parser::Csv < DataImp::Parser
  def options
    { headers: true }
  end

  def parse chunk
    chunk.to_h
  end

  def process_file &block
    CSV.open(filename, options) do |csv|
      process csv, &block
    end
  end
end
