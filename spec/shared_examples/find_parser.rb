
require "spec_helper"

RSpec.shared_examples "find parser" do |method|
  let(:parser) { subject }
  it "can find a parser" do
    expect(described_class.send(method, 'csv')).to be < DataImp::Parser
  end
  it "can find a default parser" do
    expect(described_class.send(method, '')).to be DataImp::Parser
    expect(described_class.send(method, nil)).to be DataImp::Parser
  end
  it "raise when it can't find a parser" do
    expect{
      described_class.send(method, 'foo')
    }.to raise_error(DataImp::NoParser)
  end
end
