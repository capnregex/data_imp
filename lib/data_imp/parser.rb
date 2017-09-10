require_relative 'no_parser'
class DataImp::Parser
  attr_reader :filename

  def initialize filename=nil
    @filename = filename
  end

  def self.find_parser type
    return self if type.blank?
    begin
      const_get type.camelize
    rescue NameError => e
      if require_relative "parser/#{type.underscore}"
        retry 
      end
    end
  rescue LoadError => e
    raise DataImp::NoParser.new(type)
  end

  def parse chunk
    chunk # assume chunk is a hash
  end

  def process input, &block
    index = 1
    input.each do |chunk|
      hash = parse(chunk)
      yield hash, index
      ++index
    end
  end

  def process_file &block
    open(filename) do |file|
      process file, &block
    end
  end
end

