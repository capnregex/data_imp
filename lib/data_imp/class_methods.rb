require 'pathname'

module DataImp::ClassMethods

  def root= dir
    @root = dir
  end

  def root
    @root ||= Pathname.new '.'
  end

  def data_dir= dir
    @data_dir = dir
  end

  def data_dir
    @data_dir ||= root.join('data')
  end

  def import(*args,&block)
    new(*args,&block).import
  end

  def import_list *args
    args.each do |arg| 
      arg.split.each do |word|
        import_file word
      end
    end
  end
end

