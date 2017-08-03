
require 'yaml'
class Importer::Yaml < Importer::Parser
  def data
    @data ||= YAML.safe_load(filename.read)
  end

  def parse_file
    case data
    when Hash
      import_row(data, 0)
    when Array
      data.each_with_index do |node, i|
        import_row(node, i)
      end
    end
  end
end
