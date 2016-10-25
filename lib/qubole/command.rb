require "ostruct"

module Qubole
  class Command < OpenStruct
    # 
    # Paginated commands history
    # @param page [Integer] page number
    # @param [Hash] opts addional options
    # @option attrs [String] :per_page results per page
    # 
    # @return [Array<Command>] paginated commands
    def self.page(page, opts = {})
      per_page = opts[:per_page] || 10
      Qubole.get('/commands', page: page, per_page: per_page)['commands'].map do |command|
        new(command)
      end
    end

    # 
    # Find command by id
    # @param id [Integer] command id
    # 
    # @return [Command] command instance
    def self.find(id)
      command = Qubole.get("/commands/#{id}")
      new(command)
    end

    # 
    # Update command attributes
    # @param attrs [Hash] command attributes
    # 
    # @return [Command] command instance
    def parse(attrs)
      attrs.each do |key, value|
        send("#{key}=", value)
      end
    end

    # 
    # Submit command to Qubole
    # @param params [Hash] command payload
    # 
    # @return [Command] command instance
    def submit(params = {})
      parse(params)
      response = Qubole.post('/commands', self.to_h)
      parse(response)
    end

    # 
    # Refresh command attributes
    # 
    # @return [Command] command instance
    def refresh!
      command = Qubole.get("/commands/#{id}")
      parse(command)
    end

    # 
    # Fetch command results
    # 
    # @return [Hash] parsed JSON response
    def results
      Qubole.get("/commands/#{id}/results")
    end

    # 
    # Fetch command logs
    # 
    # @return [String] command logs
    def logs
      Qubole.get("/commands/#{id}/logs")
    end

    # 
    # Hadoop jobs spawned by command
    # 
    # @return [Hash] parsed JSON response
    def jobs
      Qubole.get("/commands/#{id}/jobs")
    end

    # 
    # Cancel command
    # 
    def cancel
      Qubole.put("/commands/#{id}")
    end
  end
end
