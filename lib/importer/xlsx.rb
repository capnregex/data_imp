class Importer::Xlsx < Importer::Xls
  def options
    { extension: :xlsx }
  end
end
