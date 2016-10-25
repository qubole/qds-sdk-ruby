require 'qubole/command'

module Qubole
  module Commands
    class Hive < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'HiveCommand'
        super(attrs)
      end
    end
  end
end
