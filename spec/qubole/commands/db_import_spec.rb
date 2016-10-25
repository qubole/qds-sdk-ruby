module Qubole::Commands
  describe DbImport do
    describe "initialize" do
      it "sets correct command type" do
        command = Qubole::Commands::DbImport.new
        command.command_type = 'DbImportCommand'
      end
    end    
  end
end
