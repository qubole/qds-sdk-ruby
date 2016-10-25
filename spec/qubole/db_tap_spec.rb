module Qubole

  describe DbTap do

    before(:each) do
      Qubole.stub(:http) do |name, path, param|
        @request_type = name
        @url_path = path
        @p = param
      end
    end

  describe "Create data store" do
    it "should return correct http arguments" do
      DbTap.create({"db_name" => "doc_example",
                    "db_host" => "localhost",
                    "db_user" => "api_db",
                    "db_passwd" => "xxxxx",
                    "db_type" => "mysql",
                    "db_location" => "us-east-1"})
      expect(@request_type).to eq("POST")
      expect(@url_path).to eq("/db_taps")
      expect(@p).to eq({"db_name" => "doc_example",
                        "db_host" => "localhost",
                        "db_user" => "api_db",
                        "db_passwd" => "xxxxx",
                        "db_type" => "mysql",
                        "db_location" => "us-east-1"})

    end
  end

  describe "Edit data store" do
    it "should return correct http arguments when changing port" do
      DbTap.edit(1, {"port" => "3306"})
      expect(@request_type).to eq("PUT")
      expect(@url_path).to eq("/db_taps/1")
      expect(@p).to eq({"port" => "3306"})
    end
  end

  describe "List data stores" do
    it "should return correct http arguments" do
      DbTap.list_dbs
      expect(@request_type).to eq("GET")
      expect(@url_path).to eq("/db_taps")
      expect(@p).to eq({})
    end
  end

  describe "List tables" do
    it "should return correct http arguments" do
      DbTap.list_tables(1)
      expect(@request_type).to eq("GET")
      expect(@url_path).to eq("/db_taps/1/tables")
      expect(@p).to eq({})
    end
  end

  describe "View data store" do
    it "should return correct http arguments" do
      DbTap.view(1)
      expect(@request_type).to eq("GET")
      expect(@url_path).to eq("/db_taps/1")
      expect(@p).to eq({})
    end
  end

  describe "Delete data store" do
    it "should return correct http arguments" do
      DbTap.delete(1)
      expect(@request_type).to eq("DELETE")
      expect(@url_path).to eq("/db_taps/1")
      expect(@p).to eq({})
    end
  end

  end
end