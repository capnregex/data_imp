
require "spec_helper"

class DataImp::Porter::Test < DataImp::Porter
end

RSpec.shared_examples "find importer" do |parameter|
  let(:importer) { subject }
  it "can find a importer" do
    expect(described_class.find_importer('test')).to be < DataImp::Porter
    expect(described_class.find_importer('sample')).to be < DataImp::Porter
  end
  it "can find a default importer" do
    expect(described_class.find_importer('')).to be DataImp::Porter
    expect(described_class.find_importer(nil)).to be DataImp::Porter
  end
  it "raise when it can't find a importer" do
    expect{
      described_class.find_importer('foo')
    }.to raise_error(DataImp::NoImporter)
  end
end
