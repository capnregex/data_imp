require "spec_helper"

RSpec.describe DataImp do
  it "has a version number" do
    expect(DataImp::VERSION).not_to be nil
  end

  before do
    allow_any_instance_of(described_class).to receive(:show_progress).at_least(:once)
    allow_any_instance_of(described_class).to receive(:puts).at_least(:once)
  end
  it_behaves_like "find parser", :find_parser
  it_behaves_like "find importer", :find_importer

  let(:list) do
    <<-LIST
      hero.yaml
      heros.yaml
      hero.json
      heros.json
      heros.csv
      heros.xls
      heros.xlsx
      heros.ods
      # villans.csv
    LIST
  end

  context "class" do
    subject { described_class }
    before :each do 
      subject.options.merge!(dir: 'data')
    end
    it_behaves_like "parse file", 'hero.yaml', 'heros.yaml', 'hero.json', 'heros.json', 'heros.csv'
    it_behaves_like "parse file", 'heros.csv', 'heros.xls', 'heros.xlsx', 'heros.ods'
    it_behaves_like "import list"   
  end
  context "instance" do
    subject { described_class.new }
    it_behaves_like "parse file", 'hero.yaml', 'heros.yaml', 'hero.json', 'heros.json', 'heros.csv'
    it_behaves_like "parse file", 'heros.csv', 'heros.xls', 'heros.xlsx', 'heros.ods'
    it_behaves_like "import list"
  end
end
