require "spec_helper"

RSpec.describe DataImp::Porter do
  it_behaves_like "find importer"
  let(:hash){HashWithIndifferentAccess.new(foo: :bar, 'blue': 'beetle')}
  let(:index){1}
  subject{ described_class.new(hash, index) }
  let(:error){StandardError.new("foo")}
  it "responds as expected", :aggrigate_failures do
    expect(described_class).to respond_to :before_all_imports 
    expect(described_class).to respond_to :after_all_imports 
    is_expected.to respond_to :before_import
    is_expected.to respond_to :after_import 
    is_expected.to respond_to :import 
    is_expected.to respond_to :foo 
    is_expected.to respond_to :blue 

    expect{ described_class.before_all_imports }.not_to raise_error 
    expect{ described_class.after_all_imports }.not_to raise_error 
    expect{ subject.before_import }.not_to raise_error 
    expect{ subject.after_import }.not_to raise_error 

    expect{ subject.import }.to output(/^Import:/).to_stderr 
    expect{ subject.on_error(error) }.to output(/^Error:/).to_stderr 
    expect(subject.foo).to eq(:bar) 
    expect(subject.blurb).to be nil 
    expect(subject.hash).to eq hash 
    expect(subject.index).to be index 
    expect(subject.parse(:method,:value)).to eq :value
  end
  it "will parse missing methods" do
    expect(subject).to receive(:parse).with(:blue,'beetle').and_call_original
    expect(subject.blue).to eq 'beetle'
  end
end
