require "spec_helper"

RSpec.describe DataImp do
  it_behaves_like "find parser"
  it_behaves_like "find importer"
  it "has a version number" do
    expect(DataImp::VERSION).not_to be nil
  end
end
