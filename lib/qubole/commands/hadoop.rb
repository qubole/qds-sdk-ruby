require 'qubole/command'

module Qubole
  module Commands
    class Hadoop < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'HadoopCommand'
        super(attrs)
      end
    end
  end
end
