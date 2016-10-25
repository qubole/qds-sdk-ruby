require 'qubole/command'

module Qubole
  module Commands
    class Pig < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'PigCommand'
        super(attrs)
      end
    end
  end
end
