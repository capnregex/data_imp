
require 'data_imp/importer/sample'

RSpec.shared_examples "find importer" do |method|
  it "can find a importer" do
    expect(described_class.send(method,'test')).to be < DataImp::Importer
    expect(described_class.send(method,'sample')).to be < DataImp::Importer
  end
  it "can find a default importer" do
    expect(described_class.send(method,'')).to be DataImp::Importer
    expect(described_class.send(method,nil)).to be DataImp::Importer
  end
  it "raise when it can't find a importer" do
    expect{
      described_class.send(method,'foo')
    }.to raise_error(DataImp::NoImporter)
  end
end
