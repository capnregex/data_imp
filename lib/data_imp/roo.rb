require 'tiny_tds'
require_relative "finders"
class DataImp::Roo
end
require_relative "roo/import"
class DataImp::Roo
  extend DataImp::Finders
  extend DataImp::Tds::Import
  include DataImp::Tds::Import
  class << self
    def options
      @options ||= {
        username: ENV['MSSQL_USERNAME'], 
        password: ENV['MSSQL_PASSWORD'], 
        host: ENV['MSSQL_HOST'],
        database: ENV['MSSQL_DB'],
      }
    end

    def options= hash
      @options = options.merge(hash)
    end
  end

  def initialize options={}
    @options = self.class.options.merge(options)
  end

  def options
    @options ||= self.class.options
  end

  def options= hash
    @options = options.merge(hash)
  end
end

