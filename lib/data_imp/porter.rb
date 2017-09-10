require 'active_support/hash_with_indifferent_access'
require_relative 'no_importer'
class DataImp::Porter
  attr_reader :hash, :index

  def self.find_importer type
    return self if type.blank?
    begin
      const_get type.classify
    rescue NameError => e
      if require_relative "porter/#{type.underscore}"
        retry 
      end
    end
  rescue LoadError => e
    raise DataImp::NoImporter.new(type)
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

  def self.before_all_imports
    # called before any data is processed
  end
  
  def before_import
    # called for a record before import
  end

  def import
    # called to import a record
    warn "Import: #{self.class.name}:#{index}:#{hash.inspect}"
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
