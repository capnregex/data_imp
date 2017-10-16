RSpec.shared_examples "parse file" do |*files|
  files.each do |file|
    it "can parse file #{file}" do
      subject.import(file)
    end
  end
end
