RSpec.shared_context "tds" do
  describe "client" do
    subject { tds.client }
    it{is_expected.to be_a(TinyTds::Client)}
    it{is_expected.to be_active}
    it{is_expected.not_to be_closed}
    it{is_expected.not_to be_dead}
  end
  describe "import" do
    it "should read data from the db" do
      tds.import('sys.databases')
      names = DatabasesImporter.names
      expect(names).to include('master')
      expect(names).to include('msdb')
    end
  end
end

