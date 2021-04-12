require_relative 'stream'
require 'yaml'
class DataImp::Parser::Yaml < DataImp::Parser::Stream
  def process_string input
    YAML.safe_load(input)
  end

  def process_blob &block
    process blob, &block
  end
end
