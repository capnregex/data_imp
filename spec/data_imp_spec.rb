require "spec_helper"

class HerosImporter < DataImp::Porter
  def import
    unless name == "George"
      raise "Name #{name.inspect} does not match"
    end
    unless rank == "Sargent"
      raise "Name #{rank.inspect} does not match"
    end
    unless serial_number.to_i == 9991212
      raise "Name #{serial_number.inspect} does not match"
    end
  end
  def on_error e
    puts self.inspect
    raise e
  end
end

class HeroImporter < HerosImporter
end

RSpec.describe DataImp do
  before do
    allow_any_instance_of(described_class).to receive(:show_progress).at_least(:once)
    allow_any_instance_of(described_class).to receive(:puts).at_least(:once)
  end
  it_behaves_like "find parser"
  it_behaves_like "find importer"
  it "has a version number" do
    expect(DataImp::VERSION).not_to be nil
  end

  shared_examples "parse file" do |file|
  #  let(:filename){file}
    it "can parse file #{file}" do
      described_class.import(file)
    end
  end
  it_behaves_like "parse file", 'data/hero.yaml'
  it_behaves_like "parse file", 'data/heros.yaml'
  it_behaves_like "parse file", 'data/hero.json'
  it_behaves_like "parse file", 'data/heros.json'
  it_behaves_like "parse file", 'data/heros.csv'
  it_behaves_like "parse file", 'data/heros.xls'
  it_behaves_like "parse file", 'data/heros.xlsx'
  it_behaves_like "parse file", 'data/heros.ods'

  it "can load a list of files" do
    described_class.data_dir = 'data'
    described_class.import_list <<-LIST
      hero.yaml
      heros.yaml
      hero.json
      heros.json
      heros.csv
      heros.xls
      heros.xlsx
      heros.ods
    LIST
  end
end
