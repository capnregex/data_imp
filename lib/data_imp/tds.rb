require 'tiny_tds'
require_relative "base"
class DataImp
  class Tds < Base
    def self.default_options
      super.merge(
        username: ENV['MSSQL_USERNAME'], 
        password: ENV['MSSQL_PASSWORD'], 
        host: ENV['MSSQL_HOST'],
        database: ENV['MSSQL_DB']
      )
    end
  end
end
require_relative "tds/import"

