describe Qubole do
  before(:each) do
    Qubole.configure(api_token: 'ksbdvcwdkjn123423')
  end

  describe "::configure" do
    it "sets Qubole configuration" do
      Qubole.configure(api_token: '123', version: 'latest')
      expect(Qubole.api_token).to eq('123')
      expect(Qubole.version).to eq('latest')
    end
  end

  describe "::get" do
    context "without parameters" do
      it "sends GET request to Qubole and parses response" do
        stub_request(:get, "https://api.qubole.com/api/v1.2/fake_path")
          .to_return(status: 200, body: '{"result": "ok"}')
        expect(Qubole.get('/fake_path')).to eq('result'=>'ok')
      end

      it "sends GET request and doesn't fail on raw response" do
        stub_request(:get, "https://api.qubole.com/api/v1.2/fake_path")
          .to_return(status: 200, body: "raw data")
        expect(Qubole.get('/fake_path')).to eq("raw data")
      end
    end
    context "with parameters" do
      it "sends GET request to Qubole with encoded parameters" do
        stub_request(:get, "https://api.qubole.com/api/v1.2/fake_path?name=John%20Doe")
          .to_return(status: 200, body: '{"result": "ok"}')
        expect(Qubole.get('/fake_path', name: 'John Doe')).to eq('result'=>'ok')
      end
    end
  end

  describe "::post" do
    it "encodes data and parses response" do
      stub_request(:post, "https://api.qubole.com/api/v1.2/fake_path").with(body: '{"data":"ok"}')
        .to_return(status: 200, body: '{"result": "ok"}')
      expect(Qubole.post('/fake_path', {data: :ok})).to eq('result'=>'ok')
    end
  end

  describe "::delete" do
    it "works with empty data" do
      stub_request(:delete, "https://api.qubole.com/api/v1.2/fake_path")
        .to_return(status: 200, body: '{"result": "ok"}')
      expect(Qubole.delete('/fake_path')).to eq('result'=>'ok')
    end    
  end
end
