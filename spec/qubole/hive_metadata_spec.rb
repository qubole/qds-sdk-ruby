module Qubole

  describe HiveMetadata do

    before(:each) do
      Qubole.stub(:http) do |name, path, param|
        @request_type = name
        @url_path = path
        @p = param
      end
    end
    
  end
end