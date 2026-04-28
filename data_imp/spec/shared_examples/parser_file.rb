require 'spec_helper'

RSpec.shared_examples 'parser' do |filename, number|
  subject(:parser) { described_class.new(filename) }
  let(:records) do
    [
      { 'name' => 'George', 'rank' => 'Sargent', 'serial_number' => 9_991_212 },
      { 'name' => 'Sam', 'rank' => 'Private', 'serial_number' => 1_234_567 }
    ].take(number)
  end
  it "can process file #{filename}" do
    i = 0
    parser.process_file do |p|
      # Convert serial_number to integer to handle different parser behaviors
      p['serial_number'] = p['serial_number'].to_i
      expect(p).to eq(records[i])
      i += 1
    end
  end
end
