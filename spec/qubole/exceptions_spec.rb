module Qubole
  describe HttpException do
    before(:each) do
      Qubole.configure(api_token: 'ksbdvcwdkjn123423')
    end

    it "returns array of commands" do
      stub_request(:get, "https://api.qubole.com/api/v1.2/fake_path").to_return(status: 400)
      expect{ Qubole.get('/fake_path') }.to raise_error(Qubole::HttpException)
    end
  end
end
