require "spec_helper"

RSpec.shared_examples "parser" do |filename, number|
  subject{ described_class.new(filename) }
  let(:parser) { subject }
  let(:record) do 
    { "name"=>"George", 
      "rank"=>"Sargent", 
      "serial_number"=>number }
  end
  it "can process file #{filename}" do
    parser.process_file do |p|
      expect(p).to eq(record)
    end
  end
end
