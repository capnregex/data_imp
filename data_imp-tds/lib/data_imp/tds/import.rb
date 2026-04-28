
require 'tiny_tds'

require_relative "table"

class DataImp
  class Tds
    module Import 
      def client
        @client ||= TinyTds::Client.new(options.to_options)
      end

      def parse line
        parts = line.split('.')
        table = parts.pop
        schema = parts.shift
        super.merge(
          table: table, 
          schema: schema, 
          importer: table
        )
      end

      def parser opts
        DataImp::Tds::Table.new(client, opts)
      end
    end
    extend Import
    include Import
  end
end
