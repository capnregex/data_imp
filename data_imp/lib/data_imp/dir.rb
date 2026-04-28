require 'pathname'
module DataImp::Dir
  def self.extended(mod)
    mod.delegate :data_dir, to: :class
  end

  def root= dir
    @root = dir
  end

  def root
    @root ||= Pathname.pwd
  end

  def data_dir= dir
    path = Pathname.new(dir)
    @data_dir = 
      if path.absolute?
        path
      else
        root.join(path)
      end
  end

  def data_dir
    @data_dir ||= root.join('data')
  end
end
