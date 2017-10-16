require_relative 'no_importer'
class DataImp
  class Importer
    attr_reader :hash, :index

    def self.nil_name_error
      yield
    rescue NameError
      nil
    end

    def self.find type
      return self if type.blank?
      importer_type = type.camelize
      type_importer = importer_type + 'Importer'
      importer = nil_name_error { Object.const_get type_importer }
      importer ||= nil_name_error { const_get importer_type }
      importer || raise(DataImp::NoImporter, type, caller)
    end

    def self.process source
      before_all_imports
      index = 0
      source.each do |hash|
        index += 1
        new(hash,index).process
        show_progress index
      end
      after_all_imports
    end

    def process
      before_import
      import
      after_import
    rescue StandardError => e
      on_error e
    end

    def initialize(hash, index = nil)
      @hash = HashWithIndifferentAccess.new(hash)
      @index = index
    end

    def respond_to_missing?(method, include_private = false)
      hash.has_key?(method) || false # super
    end

    def method_missing(method, *_args)
      return nil unless respond_to_missing?(method)
      value = hash[method] 
      parse(method,value)
    end

    def parse method, value
      value # override for special handling
    end

    def self.show_progress index
      puts if index % 10_000 == 0
      print '.' if index % 100 == 0
    end

    def self.before_all_imports
      # called before any data is processed
    end
    
    def before_import
      # called for a record before import
    end

    def import
      # called to import a record
    end

    def after_import
      # called after a record was imported
    end

    def self.after_all_imports
      # called after all data is processed
    end

    def on_error e
      warn "Error: #{self.class.name}:#{index}:#{hash.inspect}"
      warn e
    end
  end
end

