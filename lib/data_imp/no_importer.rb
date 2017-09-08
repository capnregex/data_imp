class DataImp::NoPorter < StandardError
  attr_accessor :porter_type
  def initialize(porter_type)
    @porter_type = porter_type
    super <<-MSG.strip_heredoc
      Unable to find Importer for #{porter_type.inspect}
      Please define: class #{porter_type.classify}Importer < DataImp::Porter
    MSG
  end
end

