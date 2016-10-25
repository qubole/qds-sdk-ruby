require 'qubole/command'

module Qubole
  module Commands
    class DbImport < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'DbImportCommand'
        super(attrs)
      end
    end
  end
end
