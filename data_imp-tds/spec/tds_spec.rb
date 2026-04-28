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

RSpec.describe DataImp::Tds, skip: 'needs host etc' do
  let(:tds) do
    described_class.new(
      username: ENV['MSSQL_USERNAME'], 
      password: ENV['MSSQL_PASSWORD'], 
      host: ENV['MSSQL_HOST']
    )
  end
  context "instance" do
    let(:tds) { described_class.new }
    it_behaves_like 'tds'
  end
end
