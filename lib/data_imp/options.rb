class DataImp
  module Options
    def self.included mod
      mod.extend ClassMethods
    end

    def initialize hash={}
      self.options = hash
    end

    def options
      @options ||= self.class.options.compact
    end

    def options= hash
      @options = options.merge(hash)
    end

    module ClassMethods
      def default_options
        HashWithIndifferentAccess.new()
      end

      def options
        @options ||= default_options.compact
      end

      def options= hash
        @options = options.merge(hash)
      end
    end
  end
end
