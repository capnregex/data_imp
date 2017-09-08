
require 'yaml'
class DataImp::Parser::Yaml < DataImp::Parser
  def process input
    data = YAML.safe_load(input.read)
    case data
    when Hash
      yield data, 0
    when Array
      data.each_with_index do |node, index|
        yield node, index
      end
    end
  end
end
