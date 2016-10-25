require 'qubole/command'

module Qubole
  module Commands
    class Shell < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'ShellCommand'
        super(attrs)
      end
    end
  end
end
