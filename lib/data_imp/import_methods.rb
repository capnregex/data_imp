
require_relative "parser"
require_relative "porter"
require_relative "importer"

module DataImp::ImportMethods
  def import(file=nil,*args,&block)
    file.strip!
    return if file =~ /^#/
    new(file, *args,&block).import
  end

  def import_list list, *args, &block
    list.each_line do |file|
      import file, *args, &block
    end
  end
end

