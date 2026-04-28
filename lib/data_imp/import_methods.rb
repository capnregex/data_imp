
require_relative "parser"
require_relative "porter"
require_relative "importer"

module DataImp::ImportMethods
  def import(*files, **options, &block)
    files.each do |file|
      file.strip!
      unless file =~ /^#/
        new(file, **options, &block).import
      end
    end
  end

  def import_list(*lists, **options, &block)
    lists.each do |list|
      list.each_line do |file|
        import file, **options, &block
      end
    end
  end
end

