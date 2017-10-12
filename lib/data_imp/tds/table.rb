class DataImp::Tds::Table
  attr_reader :client, :table, :schema
  def initialize client, table, schema:
    @client = client
    @table = table
    @schema = schema
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
end
