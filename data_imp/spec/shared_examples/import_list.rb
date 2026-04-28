RSpec.shared_examples "import list" do
  it "can load a list of files" do
    subject.options.merge!(dir: 'data')
    subject.import_list list
  end
end
