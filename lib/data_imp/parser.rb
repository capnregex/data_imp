require_relative 'no_parser'
class DataImp::Parser

  def self.find_parser type
    return self if type.blank?
    begin
      const_get type.classify
    rescue NameError => e
      if require_relative "parser/#{type.underscore}"
        retry 
      end
    end
  rescue LoadError => e
    raise DataImp::NoParser.new(type)
  end

  def process input
    index = 1
    input.each do |chunk|
      hash = parse(chunk)
      yield hash, index
      ++index
    end
  end

  def parse chunk
    chunk # assume chunk is a hash
  end
end

