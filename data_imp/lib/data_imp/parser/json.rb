require_relative 'stream'
require 'json'
class DataImp::Parser::Json < DataImp::Parser::Stream
  def process_string input
    JSON.parse(input)
  end
end
