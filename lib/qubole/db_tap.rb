module Qubole

  # To look for what all parameters need to be passed go to http://docs.qubole.com/en/latest/rest-api/dbtap_api/
  # Pass the params as hash from above doc link
  class DbTap

    # Create a data store
    # http://docs.qubole.com/en/latest/rest-api/dbtap_api/create-a-dbtap.html#parameters
    def self.create(params={}) #check
      Qubole.post("/db_taps", params)
    end

    # To edit data store
    # http://docs.qubole.com/en/latest/rest-api/dbtap_api/edit-a-dbtap.html#parameters
    def self.edit(id, params={}) #check
      Qubole.put("/db_taps/#{id}", params)
    end

    # List data stores of account
    def self.list_dbs  #check
      Qubole.get("/db_taps")
    end

    # To list all tables in a data store
    # Pass id of datastore
    def self.list_tables(id)  #check
      Qubole.get("/db_taps/#{id}/tables")
    end

    # To view a data store
    # Pass id of datastore
    def self.view(id) #scheck
      Qubole.get("/db_taps/#{id}")
    end

    # To delete a data store
    # Pass id of datastore
    def self.delete(id) #check
      Qubole.delete("/db_taps/#{id}")
    end

  end
end