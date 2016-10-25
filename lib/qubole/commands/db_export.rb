require 'qubole/command'

module Qubole
  module Commands
    class DbExport < Command
      def initialize(attrs = {})
        attrs[:command_type] = 'DbExportCommand'
        super(attrs)
      end
    end
  end
end
