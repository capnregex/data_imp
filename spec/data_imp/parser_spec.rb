require "spec_helper"

RSpec.describe DataImp::Parser do
  let(:parser) { subject }
  it "can process input" do
    is_expected.to respond_to(:process)
    
    expect(subject).to receive(:parse).with(:foo).and_return(:bar)
    expect{|b|
      subject.process([:foo], &b)
    }.to yield_with_args(:bar,1)
  end
  it "can parse a chunk" do
    expect(subject.parse(:foo)).to eq(:foo)
  end
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
