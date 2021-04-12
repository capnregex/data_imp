require_relative 'stream'
require 'json'
class DataImp::Parser::Json < DataImp::Parser::Stream
  def process_string input
    JSON.parse(input)
  end

  def process_blob &block
    process_data JSON.parse(blob), &block
  end
end
