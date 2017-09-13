class DataImp::Tds::Table
  attr_reader :client, :table, :schema
  def initialize client, table, schema: 'dbo'
    @client = client
    @table = table
    @schema = schema
  end

  def sql
    "select * from [#{schema}].[#{table}]"
  end

  def result
    @result ||= client.execute(sql)
  end

  def each &block
    result.each &block
  end
end
