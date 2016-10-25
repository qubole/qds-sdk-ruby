require 'qubole/command'

module Qubole
  module Commands
    class DbTapQuery < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'DbTapQueryCommand'
        super(attrs)
      end
    end
  end
end
