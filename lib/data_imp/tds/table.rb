class DataImp
  class Tds
    class Table
      attr_reader :client, :table, :schema
      def initialize client, opts
        @client = client
        @table = opts[:table]
        @schema = opts[:schema]
      end

      def sql
        if schema
          "select * from [#{schema}].[#{table}]"
        else
          "select * from [#{table}]"
        end
      end

      def result
        @result ||= client.execute(sql)
      end

      def each &block
        result.each &block
      end

      def to_s
        if schema
          "TDS:#{schema}.#{table}"
        else
          "TDS:#{table}"
        end
      end
    end
  end
end
