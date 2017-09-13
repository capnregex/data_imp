require "spec_helper"
require 'data_imp/tds'

class DatabasesImporter < DataImp::Porter
  def self.before_all_imports
    @@names = []
  end
  def import
    @@names.push name
  end
  def self.after_all_imports
    @@names.sort!
  end
  def self.names
    @@names
  end
end

class DatabaseImporter < DatabasesImporter
end

RSpec.describe DataImp::Tds do
  let(:tds) do
    described_class.new(
      username: ENV['MSSQL_USERNAME'], 
      password: ENV['MSSQL_PASSWORD'], 
      host: ENV['MSSQL_HOST']
    )
  end
  describe "client" do
    subject { tds.client }
    it{is_expected.to be_a(TinyTds::Client)}
    it{is_expected.to be_active}
    it{is_expected.not_to be_closed}
    it{is_expected.not_to be_dead}
  end
  describe "import" do
    it "should read data from the db" do
      tds.import('sys.databases')
      names = DatabasesImporter.names
      expect(names).to include('master')
      expect(names).to include('msdb')
    end
  end
end
