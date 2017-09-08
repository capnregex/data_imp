require "spec_helper"

RSpec.describe DataImp::Parser do
  let(:parser) { subject }
  it_behaves_like "find parser"
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
end
