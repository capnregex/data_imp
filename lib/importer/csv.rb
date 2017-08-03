class Importer::Csv < Importer::Parser
  def options
    { headers: true }
  end

  def parse_file
    CSV.read(filename, options).each_with_index do |row, i|
      import_row(row, i)
    end
  end
end
