require 'qubole/command'

module Qubole
  module Commands
    class Spark < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'SparkCommand'
        super(attrs)
      end
    end
  end
end
