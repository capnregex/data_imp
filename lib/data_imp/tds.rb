require 'tiny_tds'
require_relative "finders"
class DataImp::Tds
  extend DataImp::Finders

  def initialize options={}
    @options = options
  end

  def options
    @options ||= {}
  end

  def client
    @client ||= TinyTds::Client.new options
  end

  def import table
    parts = table.split('.')
    table = parts.pop
    schema = parts.shift
    importer = find_importer(table)
    tbl = Table.new(client, table, schema: schema)
    puts "Importing #{table} with #{importer}"
    importer.before_all_imports
    tbl.each do |hash, index|
      porter = importer.new(hash,index)
      begin
        porter.before_import
        porter.import
        porter.after_import
        show_progress index
      rescue StandardError => e
        warn "#{table}:#{index}:#{e.class.name}"
        porter.on_error e
      end
    end
    importer.after_all_imports
    puts
  end

  def show_progress index
  end
end
require_relative "tds/table"
