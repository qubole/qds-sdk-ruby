module Qubole

  class HiveMetadata

    # To view Hive tables in QDS.
    # http://docs.qubole.com/en/latest/rest-api/hive_metadata_api/schema-or-database.html#parameters
    def self.view(schema, params={}) #check
      Qubole.get("/hive/#{schema}", params)
    end

    # To view table definition
    def table_definition(schema, table) #check for sure
      Qubole.get("/hive/#{schema}/#{table}")
    end

    # Modify metadata of table
    # http://docs.qubole.com/en/latest/rest-api/hive_metadata_api/store-table-properties.html#parameters
    def modify(schema, table, params={})
      Qubole.post("/api/v1/hive/#{schema}/#{table}/properties", params)
    end

    # Get Hive table properties
    def table_property(schema, table)
      Qubole.get("hive/#{schema}/#{table}/table_properties")
    end

    # Delete properties associated with a Hive table
    def delete_property(schema, table)
      Qubole.delete("/hive/#{schema}/#{table}/properties")
    end
  end

end