namespace :db do
  namespace :export do
    include FileUtils
    desc "export db as csv files"
    task csv: :environment do
      dir = "db/export/csv"
      mkdir_p dir
      tables = ActiveRecord::Base.connection.tables
      tables.each do |table|
        sql = <<~SQL
          select * from #{table}
        SQL
        result = ActiveRecord::Base.connection.exec_query sql
        file = "#{dir}/#{table}.csv"
        CSV.open(file, "wb") do |csv|
          csv << result.columns
          result.rows.each do |row|
            csv << row
          end
        end
        puts "exported ${file}"
      end
    end

    desc "export db as json files"
    task json: :environment do
      dir = "db/export/json"
      mkdir_p dir
      tables = ActiveRecord::Base.connection.tables
      tables.each do |table|
        sql = <<~SQL
          select * from #{table}
        SQL
        result = ActiveRecord::Base.connection.exec_query sql
        file = "#{dir}/#{table}.json"
        open file, "w" do |file|
          file.write result.to_hash.to_json
        end
        puts "exported ${file}"
      end
    end


    desc "export db as prettified json files"
    task pretty_json: :environment do
      dir = "db/export/pretty_json"
      mkdir_p dir
      tables = ActiveRecord::Base.connection.tables
      tables.each do |table|
        sql = <<~SQL
          select * from #{table}
        SQL
        result = ActiveRecord::Base.connection.exec_query sql
        file = "#{dir}/#{table}.json"
        open file, "w" do |file|
          file.write JSON.pretty_generate(result.to_hash)
          file.puts
        end
        puts "exported ${file}"
      end
    end

    desc "export db as yaml files"
    task yaml: :environment do
      dir = "db/export/yaml"
      mkdir_p dir
      tables = ActiveRecord::Base.connection.tables
      tables.each do |table|
        sql = <<~SQL
          select * from #{table}
        SQL
        result = ActiveRecord::Base.connection.exec_query sql
        file = "#{dir}/#{table}.yaml"
        open file, "w" do |file|
          file.write result.to_hash.to_yaml
        end
        puts "exported ${file}"
      end
    end
  end
end
