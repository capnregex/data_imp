require "spec_helper"

RSpec.shared_examples "parser" do |filename, number|
  describe "file" do
    subject{ described_class.new(filename: filename) }
    let(:parser) { subject }
    let(:record) do 
      { "name"=>"George", 
        "rank"=>"Sargent", 
        "serial_number"=>number }
    end
    it "can process file #{filename}" do
      parser.each do |p|
        expect(p).to eq(record)
      end
    end
  end
  describe "blob" do
    let(:blob) { File.read(filename) }
    subject{ described_class.new(blob: blob) }
    let(:parser) { subject }
    let(:record) do 
      { "name"=>"George", 
        "rank"=>"Sargent", 
        "serial_number"=>number }
    end
    it "can process blob #{filename}" do
      parser.each do |p|
        expect(p).to eq(record)
      end
    end
  end
end
