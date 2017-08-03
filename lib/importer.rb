
module Importer
  class << self
    attr_reader :data_dir
  end

  def self.data_dir= *dirs
    @data_dir ||= Rails.root.join(*dirs)
  end

  def self.import_file filename
    ext = File.extname(filename)
    base = File.basename(filename, ext)
    ext = ext.downcase.sub('.','')
    parser_class_name = ext.classify
    importer_class_name = base.concat('_importer').classify
    file = data_dir.join(filename)
    begin
      parser = const_get(parser_class_name)
      importer = importer_class_name.constantize
    rescue NameError => e
      warn "No importer class: #{e}"
      return 
    end
    parser.new(file, importer).import
  end

  def self.import *args
    args.each do |arg| 
      arg.split.each do |word|
        import_file word
      end
    end
  end

end
