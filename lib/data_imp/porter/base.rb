class Importer::Base < Importer::Row
  attr_reader :hash, :index

  def initialize(hash, index)
    @hash = hash
    @index = index
  end

  def respond_to_missing?(method, include_private = false)
    hash.has_key?(method.to_sym) || hash.has_key?(method.to_s) || false # super
  end

  def method_missing(method, *_args)
    return nil unless has_key? method # return nil for unknown methods
    value = hash[method.to_sym] || hash[method.to_s] # treat like indifferent
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

  def self.on_error e
    warn "Error: #{self.class.name}:#{index}:#{hash.inspect}"
    warn e
  end
end
