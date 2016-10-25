require 'qubole/command'

module Qubole
  module Commands
    class Composite < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'CompositeCommand'
        super(attrs)
      end
    end
  end
end
