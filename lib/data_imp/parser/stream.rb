class DataImp::Parser::Stream < DataImp::Parser
  def process input
    if input.respond_to? :read
      input = input.read
    end
    data = process_string(input)
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
