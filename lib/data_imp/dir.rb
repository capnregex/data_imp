require 'pathname'
class DataImp
  module Dir
    def root= dir
      options.merge!(root: dir)
    end

    def root
      options[:dir]
    end

    def data_dir= dir
      options.merge!(dir: dir)
    end

    def data_dir
      options[:dir]
    end
  end
  extend Dir
end
