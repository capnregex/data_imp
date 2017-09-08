
require "spec_helper"

RSpec.shared_examples "find parser" do |parameter|
  let(:parser) { subject }
  it "can find a parser" do
    expect(described_class.find_parser('csv')).to be < DataImp::Parser
  end
  it "can find a default parser" do
    expect(described_class.find_parser('')).to be DataImp::Parser
    expect(described_class.find_parser(nil)).to be DataImp::Parser
  end
  it "raise when it can't find a parser" do
    expect{
      described_class.find_parser('foo')
    }.to raise_error(DataImp::NoParser)
  end
end
