require "spec_helper"
require 'data_imp/tds'

RSpec.describe DataImp::Tds do
  context "class" do
    let(:tds) { described_class }
    # it_behaves_like 'tds'
  end
  context "instance" do
    let(:tds) { described_class.new }
    # it_behaves_like 'tds'
  end
end
