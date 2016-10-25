require 'qubole/command'

module Qubole
  module Commands
    class Presto < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'PrestoCommand'
        super(attrs)
      end
    end
  end
end
