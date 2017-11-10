require_relative 'no_parser'
require_relative 'options'
class DataImp
  class Parser
    include DataImp::Options

    def self.find type
      return self if type.blank?
      parser_type = type.classify
      type_parser = parser_type + 'Parser'
      if Object.const_defined? type_parser
        return Object.const_get type_parser
      elsif const_defined? parser_type
        return const_get parser_type
      else
        raise DataImp::NoParser.new(type)
      end
    end

    def parse chunk
      chunk # assume chunk is a hash
    end

    def process input, &block
      index = 1
      input.each do |chunk|
        hash = parse(chunk)
        block.call hash, index
        index += 1
      end
    end

    def filename
      if options.has_key? :filename
        Pathname.pwd.join(options[:filename])
      elsif options.has_key? :line and options.has_key? :dir
        Pathname.pwd.join(options[:dir],options[:line])
      end
    end

    def process_file &block
      open(filename) do |file|
        process file, &block
      end
    end

    def each &block
      process_file &block
    end

  end
end
require_relative 'parser/csv'
require_relative 'parser/json'
require_relative 'parser/yaml'

