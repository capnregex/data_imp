class DataImp::Parser::Stream < DataImp::Parser
  def process input, &block
    if input.respond_to? :read
      input = input.read
    end
    process_data process_string(input), &block
  end

  def process_data data, &block
    case data
    when Hash
      block.call(data, 0)
    when Array
      data.each_with_index do |node, index|
        block.call(node, index)
      end
    end
  end
end
