class DataImp::NoParser < StandardError
  attr_accessor :parser_type
  def initialize(parser_type)
    @parser_type = parser_type
    super <<-MSG.strip_heredoc
      Unable to find Parser for #{parser_type.inspect}
      Please define: class #{parser_type.classify}Parser < DataImp::Parser
    MSG
  end
end

